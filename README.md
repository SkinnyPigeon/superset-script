# Superset shortcut

This allows a user to start Superset via an icon to make the startup as frictionless as possible. It requires [Docker Desktop](https://www.docker.com/products/docker-desktop/) to be installed first. 

Next, you need to clone the [Superset](https://github.com/apache/superset) repo:

 ```bash
git clone https://github.com/apache/superset.git
 ```

You can now clone this repo:

```bash
git clone https://github.com/SkinnyPigeon/superset-script.git
```

If needed, edit the `superset_script.command` to point to where you have cloned the Superset repo by updating line 23.

In the terminal you will now need to make the command executable by running:

```bash
cd superset-script
chmod a+x superset_script.command
```

For ease of use, you can now make an alias for this command by right clicking on it in the Finder and selecting `Make Alias`. You can now rename the alias to `Superset` or something similar. In addition, you can open the included `icon.png` in `Preview` then select and copy the image. If you open the information panel for the alias, you can now select its icon in the top left of the panel and paste in the logo.

With this done you are free to move the alias wherever you want and it will execute the command when opened. The command itself will start Docker and run the two `docker-compose` commands.

After a minute or two you will find Superset running in your browser at http://localhost:8088.

---

## Adding an extra database

Superset comes with its own installation of PostgreSQL. We can leverage that and create our own database within it to do our work from.

First you will need to create the database by running the following:

```bash
docker exec -it superset_db bash
psql -U superset
```
Followed by:

```sql
create database work;
\q
exit
```

You can now add this as a database within Superset. Navigate to http://localhost:8088/databaseview/list/ and click on the `+ DATABASE` button.

Select `PostgreSQL` as the database and enter the following details:

- Host: superset_db
- Port: 5432
- Database Name: work
- Username: superset
- Password: superset
- Display Name: Work

Now click `Connect` and then `Finish`.

To be able to upload documents to the database, you can click on the `Edit` icon under the `Action` column for the new connection. Now select `Advanced` then `Security` and check the box for `Allow file uploads to database`. 

You are now all set 🚀