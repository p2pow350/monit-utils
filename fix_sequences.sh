#!/bin/bash
# FIX INVALID COUNTER AFTER IMPORTS

pg_c="psql pyfreebilling"
#PROVIDER FIX
p_fixop=`${pg_c} -t -c "SELECT setval('provider_rates_id_seq',(SELECT GREATEST(MAX(id)+1,nextval('provider_rates_id_seq'))-1 FROM provider_rates));"`

#CUSTOMER FIX
c_fixop=`${pg_c} -t -c "SELECT setval('customer_rates_id_seq',(SELECT GREATEST(MAX(id)+1,nextval('customer_rates_id_seq'))-1 FROM customer_rates));"`
