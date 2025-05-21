# Supabase with apisix & apisix-dashboard

This is a minimal Docker Compose setup for self-hosting Supabase. Follow the steps [here](https://supabase.com/docs/guides/hosting/docker) to get started.

Steps :
1. Pull Image from `https://github.com/mukulgargg/supabase_with_apisix.git`
2. cd to/path/project
3. docker-compose pull
4. docker-compose up -d
5. docker-compose up apisix-init


Components & Ports

1. Supabase Public Gateway
    `http://localhost:8000`
    Username : admin
    password : admin

2. Supabase Dashboard (Studio)
    `http://localhost:8000`
    Username : admin
    password : admin

3. APISIX Admin API
    `http://localhost:9180`

4. APISIX Dashboard UI
    `http://localhost:9000`
    Username : admin
    password : admin
