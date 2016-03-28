## Usage
First use [houselabs/strongswan-buildconf](https://github.com/houselabs/docker-strongswan-buildconf) to build config files

```bash
docker pull houselabs/strongswan-buildconf
docker run -i -v /data/strongswan:/data \
  -e VPN_DOMAIN=yourvpndomain.com \
  -e VPN_DNS=192.168.0.1 \
  -e VPN_SUBNET=192.168.1.0/24 \
  -e VPN_PSK=sdasdas \
  -e VPN_USERNAME=ohsc \
  -e VPN_PASSWORD=pppsssswwwddd \
  -e VPN_P12_PASSWORD=lock \
  houselabs/strongswan-buildconf
```

The builder will save all config files in /data/strongswan

Then run the strongswan

```bash
docker pull houselabs/strongswan
docker run --name=strongswan \
  --privileged=true \
  --net=host \
  --cap-add=ALL \
  -e VPN_SUBNET=192.168.2.0/24 \
  -v /lib/modules:/lib/modules \
  -v /data/strongswan/ipsec.conf:/etc/ipsec.conf \
  -v /data/strongswan/ipsec.d:/etc/ipsec.d \
  -v /data/strongswan/ipsec.secrets:/etc/ipsec.secrets \
  -v /data/strongswan/strongswan.conf:/etc/strongswan.conf \
  -v /data/strongswan/strongswan.d:/etc/strongswan.d \
  houselabs/strongswan

```
Or you may also use the systemd unit file.

Finally, all certs for client are generated in /data/strongswan/ssl. You may copy them to your client. And a mobileconfig for iOS/Mac is generated. You can install to your iOS / Mac directly.
