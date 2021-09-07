CMP_ID=`oci iam compartment list --name  demonosql | jq -r '."data"[].id'`
export COMP_ID=${CMP_ID-$OCI_TENANCY}
export NOSQL_COMP_ID=${CMP_ID-$OCI_TENANCY}
export NOSQL_USER_ID=`cat ~/info.json | jq -r '."data"."user-id"'`
export NOSQL_FINGERPRINT=`cat ~/info.json | jq -r '."data"."fingerprint"'`
export NOSQL_PRIVKEY_FILE=~/NoSQLLabPrivateKey.pem
echo $OCI_REGION
echo $OCI_TENANCY
echo $NOSQL_USER_ID
echo $NOSQL_FINGERPRINT
echo $NOSQL_PRIVKEY_FILE
echo $NOSQL_COMP_ID