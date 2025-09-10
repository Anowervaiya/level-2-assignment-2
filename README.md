# 📘 PostgreSQL Assignment Bonus Questions (বাংলায় উত্তর)

## প্রশ্ন 1 — PostgreSQL কি?

PostgreSQL হলো একটি শক্তিশালী, ওপেন-সোর্স রিলেশনাল ডাটাবেজ ম্যানেজমেন্ট সিস্টেম (RDBMS)। এটা স্ট্যান্ডার্ড SQL সমর্থন করে এবং জটিল ট্রানজেকশন, ACID সেফটি, কাস্টম ফাংশন (PL/pgSQL সহ), ভিউ, ট্রিগার, এবং এক্সটেনশান (যেমন PostGIS) দেয়।  

PostgreSQL সাধারণত তথ্য-নির্ভর অ্যাপ্লিকেশন, জিওস্পেশিয়াল সেবা, analytics, এবং production-grade ব্যাকএন্ড সার্ভিসে ব্যবহৃত হয়।  

**উদাহরণ:**  
```sql
CREATE DATABASE mydb;
```
এবং `psql` ক্লায়েন্ট দিয়ে পরিচালনা করা যায়।


## প্রশ্ন 2 — PostgreSQL-এ database schema এর উদ্দেশ্য কি?

Schema হলো ডাটাবেসের মধ্যে একটি যুক্তিবদ্ধ নামস্থান (namespace) — এটি টেবিল, ভিউ, ফাংশন, টাইপ ইত্যাদি গোষ্ঠীভুক্ত করে। Schema ব্যবহারের সুবিধা: 

**উদাহরণ:**  
- একই ডাটাবেসে বিভিন্ন প্রজেক্ট/মডিউল আলাদা করার সুবিধা (উদাহরণ: `public`, `analytics`, `archive`)।

- নাম সংঘর্ষ (name collision) কমায় — একই নামে দুইটি টেবিল আলাদা `schema` তে থাকতে পারে।

- অনুমতি ও রোল ভিত্তিক অ্যাক্সেস নিয়ন্ত্রণ সহজ করে (GRANT/REVOKE)।
- উদাহরণ: `CREATE SCHEMA research; SET search_path TO research, public;`

## প্রশ্ন 3 — Primary Key (PK) ও Foreign Key (FK) কি এবং কিভাবে কাজ করে?

## Primary Key (PK):

- প্রতিটি রেকর্ডকে ইউনিকভাবে চিহ্নিত করে। একাধিক কলামের যৌথ PK ও সম্ভব।

- সাধারণত `NOT NULL ও UNIQUE।`

- উদাহরণ: CREATE TABLE rangers (ranger_id SERIAL PRIMARY KEY, name TEXT);

## Foreign Key (FK):

- এক টেবিলকে অন্য টেবিলের `PK` (বা `UNIQUE` কলাম) এর সাথে যুক্ত করে রিলেশন তৈরি করে।

- রেফারেন্সড টেবিলের সাথে ডাটা ইন্টিগ্রিটি নিশ্চিত করে — orphan রেকর্ড আটকায়।

- **উদাহরণ:**  `CREATE TABLE sightings (sighting_id SERIAL PRIMARY KEY, ranger_id INT REFERENCES rangers(ranger_id));``FK` কনস্ট্রেইন্ট ডিফল্টভাবে রেফারেন্স ইন্টিগ্রিটি বজায় রাখে — যদি রেফারেন্সড `rangers` এ `ranger_id` না থাকে তাহলে `INSERT` ব্যর্থ হবে; অথবা `ON DELETE CASCADE` ব্যবহার করে ডিলেট-এ স্বয়ংক্রিয়ভাবে সম্পর্কিত রেকর্ড মুছতে দেয়।
