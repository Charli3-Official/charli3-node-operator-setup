FROM nixos/nix AS builder

RUN echo "substituters = https://cache.nixos.org https://hydra.iohk.io" >> /etc/nix/nix.conf &&\
    echo "trusted-public-keys = cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" >> /etc/nix/nix.conf

RUN nix-channel --update

WORKDIR /app
ARG PLUTUS_GIT_COMMIT=b3e3ca8ee2f126ebb46c5a77cef301e55c28dd30
RUN git clone https://github.com/joinplank/plutus-apps.git /app/plutus-apps && \
        cd /app/plutus-apps && \
        git checkout ${PLUTUS_GIT_COMMIT}

WORKDIR /app/plutus-apps

RUN nix-shell --extra-experimental-features flakes --run 'cabal update && cabal build plutus-pab'

WORKDIR /app
COPY ./charli3-oracle-prototype /app/oracle-pab

WORKDIR /app/plutus-apps
RUN nix-shell --extra-experimental-features flakes --run 'cd ../oracle-pab ; cabal v2-build pab'

FROM fpco/haskell-scratch:integer-simple 
WORKDIR /app
COPY --from=builder /app/oracle-pab/dist-newstyle/build/x86_64-linux/ghc-8.10.4.20210212/oracle-prototype-0.0.0.3/x/pab/build/pab /usr/bin/pab
