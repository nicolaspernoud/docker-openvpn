# docker-openvpn
Openvpn docker containers for both client and server, with automated PKI creation script

## Usage

### Server side

Copy the `server` directory to the server host and `cd` to the directory.
Build the container : `./build.sh`.
Initialize the PKI : Alter `init.sh` to replace `CHANGE_THIS` with your values (or let it be for personnal use) and `./init.sh`.
Create your client(s) : `./create-client.sh <YOUR-CLIENT-NAME>`.
Alter the ccds in `./conf/openvpn/ccd` to push routes to your clients if needed. Alter `server.conf` accordingly.
Start the service : `./up.sh`.

### Client side

Copy the `client` directory to the client(s) and `cd` to the directory.
Copy `<YOUR-CLIENT-NAME>.key`, `ca.crt`, `<YOUR-CLIENT-NAME>.crt`, `ta.key`, from the server directory.
Alter `client.conf` to replace `<YOUR-SERVER-IP-OR-HOSTNAME>` with your server public IP or hostname and `<YOUR-CLIENT-NAME>` with your client name, alter the routes (`route 192.168.1.0 255.255.255.0`) to your needs.
Build and start the service : `./build.sh && ./up.sh`.
