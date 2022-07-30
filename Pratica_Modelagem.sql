CREATE DATABASE bank;


CREATE TABLE states(id SERIAL PRIMARY KEY, name VARCHAR(30) UNIQUE NOT NULL);

CREATE TABLE cities(id SERIAL PRIMARY KEY, name VARCHAR(30) NOT NULL, "stateId" SERIAL REFERENCES cities(id) NOT NULL);

CREATE TABLE customers(id SERIAL PRIMARY KEY, "fullName" VARCHAR(50) NOT NULL, cpf CHAR(11) UNIQUE NOT NULL, email TEXT NOT NULL, password TEXT NOT NULL);

CREATE TABLE "customerAddresses"(id SERIAL PRIMARY KEY, "customerId" SERIAL UNIQUE REFERENCES customers(id) NOT NULL, street TEXT, number NUMERIC, complement TEXT, "postalCode" NUMERIC NOT NULL, "cityId" SERIAL REFERENCES cities(id) NOT NULL);

CREATE TABLE "customerPhones"(id SERIAL PRIMARY KEY, "customerId" SERIAL REFERENCES customers(id) NOT NULL, number NUMERIC NOT NULL, type VARCHAR(20));

CREATE TABLE "bankAccount"(id SERIAL PRIMARY KEY, "customerId" SERIAL REFERENCES customers(id), "accountNumber" NUMERIC UNIQUE NOT NULL, agency NUMERIC NOT NULL, "openDate" TIMESTAMP DEFAULT NOW(), "closeDate" timestamp);

CREATE TABLE transactions(id SERIAL PRIMARY KEY, "bankAccountId" SERIAL REFERENCES "bankAccount"(id) NOT NULL, amount NUMERIC NOT NULL, type TEXT, time TIMESTAMP NOT NULL DEFAULT NOW(), description TEXT, cancelled BOOLEAN);

CREATE TABLE "creditCards"(id SERIAL PRIMARY KEY, "bankAccountId" SERIAL REFERENCES "bankAccount"(id) NOT NULL, number NUMERIC UNIQUE NOT NULL, "securityCode" TEXT UNIQUE NOT NULL, "expirationMonth" VARCHAR(2) NOT NULL, "expirationYear" CHAR(4) NOT NULL, password CHAR(6) NOT NULL, "limit" NUMERIC NOT NULL);