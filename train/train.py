import os, mlflow, random
mlflow.set_tracking_uri(os.getenv("MLFLOW_TRACKING_URI", "http://mlflow:5000"))
mlflow.set_experiment("poc-experiment")
with mlflow.start_run():
    mlflow.log_param("epochs", 5)
    acc = random.uniform(0.8, 0.95)
    mlflow.log_metric("accuracy", acc)
    with open("model.txt","w") as f: f.write("dummy-model")
    mlflow.log_artifact("model.txt")
    print("Logged run to MLflow, accuracy:", acc)
