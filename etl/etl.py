import os
from google.cloud import storage
RAW_BUCKET = os.getenv("RAW_BUCKET", "your-project-id-etl-data")
PROCESSED_BUCKET = os.getenv("PROCESSED_BUCKET", "your-project-id-ml-models")

def process_images():
    client = storage.Client()
    raw_bucket = client.bucket(RAW_BUCKET)
    processed_bucket = client.bucket(PROCESSED_BUCKET)
    for blob in raw_bucket.list_blobs():
        print(f"Processing {blob.name}")
        processed_blob = processed_bucket.blob(blob.name)
        processed_blob.upload_from_string(blob.download_as_bytes())

if __name__ == "__main__":
    process_images()
