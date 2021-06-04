\echo *** CONVERT RELATIONAL-DB (CUSTOMERS) INTO JSONB-DB (CUSTOMERS_JSONB) ***
\echo

DROP TABLE IF EXISTS CUSTOMERS_JSONB;

CREATE table CUSTOMERS_JSONB as(
    SELECT
        customerid,
        jsonb_build_object('personal',
            jsonb_build_object(
                'name', jsonb_build_object('firstname', firstname, 'lastname', lastname),
                'gender', gender,
                'age', age,
                'income', income,
                'contact', jsonb_build_object('email', email, 'phone', phone)
            )
        ) as "personal",

        jsonb_build_object('location',
            jsonb_build_object(
                'address1', address1, 
                'address2', address2, 
                'city', city,
                'state', state,
                'zip', zip,
                'country', country,
                'region', region
            )
        ) as "location",

        jsonb_build_object(
            'creditcardtype', creditcardtype, 
            'creditcard', creditcard, 
            'creditcardexpiration', creditcardexpiration
        ) as "credit",

        jsonb_build_object(
            'username', username, 
            'password', password
        ) as "login"
        
    FROM CUSTOMERS
);

