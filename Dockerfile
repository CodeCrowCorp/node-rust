FROM node

# Update default packages
RUN apt-get -qq update

# Get Ubuntu packages
RUN apt-get install -y -q \
    build-essential \
    curl

RUN curl https://sh.rustup.rs -sSf | \
    sh -s -- --default-toolchain stable -y

# Add .cargo/bin to PATH
ENV PATH="/root/.cargo/bin:${PATH}"

RUN cargo install worker-build

ENV PATH="/root/.worker-build/bin:${PATH}"

ENV PATH="/root/.wasm-pack/bin:${PATH}"

# Check cargo is visible
RUN cargo --help