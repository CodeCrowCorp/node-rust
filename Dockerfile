# syntax=docker/dockerfile:1
FROM node

# Wrangler npm package
RUN npm install -g wrangler

# Update default packages
RUN apt-get -qq update

# Get Ubuntu packages
RUN apt-get install -y -q \
    build-essential \
    curl

# Rustup
RUN curl https://sh.rustup.rs -sSf | \
    sh -s -- --default-toolchain stable -y

# Add .cargo/bin to PATH
ENV PATH="/root/.cargo/bin:${PATH}"

# Following commands will be executed using 
# bash shell 
SHELL [ "/bin/bash", "-c" ]

# Install Cargo Crates
# wasm-pack worker-build 
RUN cargo install wasm-pack worker-build
# worker-rs
RUN cargo install -q --git https://github.com/cloudflare/workers-rs
