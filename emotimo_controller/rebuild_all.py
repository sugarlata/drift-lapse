# /// script
# requires-python = ">=3.11"
# dependencies = [
#     "fastapi-code-generator",
# ]
# ///
import subprocess

FASTAPI_GENERATION_LOCATION  = "_generated/fastapi"
PYDANTIC_MODELS_FILE = "app/models.py"

print("")
print("TypeSpec Compiling OpenAPI Spec and JSON Schema")
print("-----------------------------------------------")
print(
    subprocess.run(
        [
            "tsp",
            "compile",
            "tsp/.",
        ],
        shell=True,
        text=True,
        capture_output=True,
    ).stdout
)

print(
    subprocess.run(
        [
            "tsp",
            "compile",
            "tsp/.",
            "--option",
            "@typespec/json-schema.bundleId=models.json",
        ],
        shell=True,
        text=True,
        capture_output=True,
    ).stdout
)

print("------------------ Completed ------------------")

print("")
print("Generating models.py")
print("-----------------------------------------------")
print(
    subprocess.run(
        [
            "datamodel-codegen",
            "--input",
            "_generated/@typespec/json-schema/models.json",
            "--input-file-type",
            "jsonschema",
            "--output",
            PYDANTIC_MODELS_FILE,
        ],
        shell=True,
        text=True,
        capture_output=True,
    ).stdout
)
print("------------------ Completed ------------------")

print("")
print("Generating boilerplate")
print("-----------------------------------------------")
print(
    subprocess.run(
        [
            "fastapi-codegen",
            "-i",
            "openapi-spec.yml",
            "-o",
            FASTAPI_GENERATION_LOCATION,
            "-r",
        ],
        shell=True,
        text=True,
        capture_output=True,
    ).stdout
)
print("------------------ Completed ------------------")
print("")
print("Locations:")
print("- OpenAPI Spec: <project_root>/openapi-spec.yml")
print(f"- FastAPI Routes: <project_root>/{FASTAPI_GENERATION_LOCATION}/")
print(f"- Pydantic Models File: <project_root>/{PYDANTIC_MODELS_FILE}")
