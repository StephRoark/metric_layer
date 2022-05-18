# Welcome to my first dbt project!

Super rough outline for 'How to get started with dbt metrics and BigQuery'.

### Before starting
1. Extract and Load some data into BigQuery
   1. (Optional) Setup billing in Google Cloud (could use local Postgres instead) and attach it to the Google Cloud project you are going to use.  This is because some of the DML commands I used required billing to be setup. I setup a billing budget also, to try and avoid a surprise (again could setup local Postgres to avoid a surprise bill).
   2. (Optional) I setup a new project in GCloud: `metricslayer`
   3. Create a new dataset in BigQuery. In my case made a US Region dataset and called it `austin_bikes_metrics`
   4. Create a new table in BigQuery. This is where the extracted data will go.  My table schema was the same schema as `bigquery-public-data.austin_bikeshare.bikeshare_trips` as that is where I "extracted" "raw" data from.
   5. Extract the data.  I got only a sample of the data, because I wanted things later to run fast.  `INSERT INTO `metricslayer.austin_bikes_metrics.bikeshare_rides`
      SELECT * FROM 'bigquery-public-data.austin_bikeshare.bikeshare_trips'
      WHERE rand() < 0.01`.  Of course change the table you insert INTO to your gcloud project, dataset, and desired table name.
2. Setup dbt for local development 
   1. Install dbt for target db.  Directions here (except setup for BigQuery, not Postgres): `https://blog.jetbrains.com/big-data-tools/2022/01/25/how-i-started-out-with-dbt/` for 'BQ:https://docs.getdbt.com/docs/available-adapters'
   2. Create service account in gcloud (or reuse service account if one already created.)  Directions here: 'https://medium.com/@ivan_toriya/step-by-step-guide-to-run-dbt-in-production-with-google-cloud-platform-fb1f035f3c7b'
   3. Create or add a JSON key for the service account and download it.  Do not place this key anywhere public.
   4. Setup dbt profile.  Run `dbt init` to do this.  Use service account and the JSON key you just downloaded
3. Configure and run dbt.
   1. Clone or fork this project.
   2. Change everywhere `metricslayer` to your project name.
   3. Change everywhere `austin_bikes_metrics` to your dataset name.
   4. If you picked a table other than `bikeshare_rides` change that in the source model.
   5. Change in the `dbt_project.yml` file `profile:` parameter to match the profile from step 2 above.


### Using the starter project

Try running the following commands:
- dbt deps
- dbt run
- dbt test
- dbt docs generate
- dbt docs serve


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
