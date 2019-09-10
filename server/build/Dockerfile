# Get easy-rsa
FROM alpine as git-cloner
RUN apk add --no-cache git
WORKDIR /
RUN git clone https://github.com/OpenVPN/easy-rsa.git

# Build container
FROM alpine

VOLUME ["/vpn"]

# Install needed packages
RUN apk add --no-cache openssl openvpn

# Install easy-rsa
WORKDIR /
COPY --from=git-cloner /easy-rsa /easy-rsa

# User interface
ADD entrypoint.sh .
ADD init.sh .
RUN chmod +x entrypoint.sh init.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["start"]
