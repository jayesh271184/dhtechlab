LOAD DATA
APPEND INTO TABLE ADUKA.dpcc_cdr
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '""'
TRAILING NULLCOLS
(
SESSION_ID ,
RATING_GROUP ,
REPORTED_CHARGINGKEY ,
SERVICES ,
REPORTED_VOLUME ,
REPORTED_TIME ,
REPORTED_EVENT ,
VOLUME_PULSE ,
CALCULATED_VOLUME_PULSE ,
TIME_PULSE ,
CALCULATED_TIME_PULSE ,
UNACCOUNTED_VOLUME ,
UNACCOUNTED_TIME ,
PREVIOUS_UNACCOUNTED_VOLUME ,
PREVIOUS_UNACCOUNTED_TIME ,
ACCOUNTED_NON_MONETARY_VOLUME ,
ACCOUNTED_NON_MONETARY_TIME ,
ACCOUNTED_VOLUME ,
ACCOUNTED_TIME ,
ACCOUNTED_MONETARY ,
RATE ,
DISCOUNT_PCT ,
DISCOUNTED_AMOUNT ,
RATE_MINOR_UNIT ,
CURRENCY ,
EXPONENT ,
PACKAGE_NAME ,
PACKAGE_VERSION ,
PRODUCT_OFFER_NAME ,
PRODUCT_OFFER_VERSION ,
EVENT_ACTION ,
QUOTA_PROFILE ,
CDR_LEVEL ,
CALLING_PARTY ,
CALLED_PARTY ,
RATECARD ,
TARIFF_VERSION ,
RATECARD_GROUP ,
OPERATION ,
CDR_SERVICE ,
CALL_TYPE ,
TARIFF_TYPE ,
TARIFF_SUB_TYPE ,
REVENUE_CODE ,
CALL_START DATE 'DD/MON/YY HH24:MI:SS',
CALL_STOP DATE 'DD/MON/YY HH24:MI:SS',
BASE_CURRENCY ,
EXCHANGE_RATE ,
IS_RERATE ,
CALLED_ZONE  CHAR(1000),
CALLING_ZONE ,
MONETARY_OVERCHARGED ,
PACKAGE_ID ,
RATE_CARD_ID ,
REPORTED_UPLOADVOLUME ,
REPORTED_DOWNLOADVOLUME ,
CALLED_NETWORK_NAME ,
REQUEST_TYPE ,
CALLED_PREFIX ,
CALLED_COUNTRY ,
CALLED_OPERATOR ,
CALL_DIRECTION ,
BILLING_ACCOUNT_NUMBER ,
SERVICE_INSTANCE_NUMBER ,
MSISDN ,
IMSI ,
FRAMED_IP_ADDRESS ,
ACCESS_NETWORK ,
SUBSCRIBER_MCC ,
SUBSCRIBER_MNC ,
DEVICE_BRAND ,
DEVICE_MODEL ,
DEVICE_TAC ,
DEVICE_SNR ,
DEVICE_SVN ,
ULI_LAC_2G_3G ,
ULI_CellID_2G ,
ULI_SAC_3G ,
ULI_TAI_4G ,
ULI_eCGI_4G ,
SGSN_ADDRESS ,
VLR_MSC_NUMBER ,
SGSN_MCC_MNC ,
CUSTOMER_TYPE ,
TRANS_TYPE ,
BPO_ID ,
BPO_NAME ,
BPO_TRANSACTIONID ,
BPO_VERSION ,
SOURCE_ZONE ,
REQUEST_SEQ ,
IMEI ,
APN ,
SUBSCRIBER_ID ,
BILLING_DAY ,
GEOLOCATION ,
CUSTOM1 ,
CUSTOM2 ,
CUSTOM3 ,
CUSTOM4 ,
CUSTOM5 ,
CALLING_COUNTRY ,
CALLING_OPERATOR ,
CUSTOM_PCC_KEYS CHAR(1000),
CDRTIMESTAMP DATE 'DD/MON/YY HH24:MI:SS'
)

