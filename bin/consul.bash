# Get Key
curl http://consol-url/v1/kv/key

# Create/Update Key
curl --request PUT --data-binary @contents http://consol-url/v1/kv/key

# Delete Key
curl --request DELETE --data-binary @contents http://consol-url/v1/kv/key

