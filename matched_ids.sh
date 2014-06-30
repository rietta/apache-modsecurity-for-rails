grep -oh '\[id \"[0-9]*\"' modsec_audit.log | sort | uniq  | cut -d '"' -f 2

