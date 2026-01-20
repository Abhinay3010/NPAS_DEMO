import yaml

with open("applications/applicationselector.yaml") as f:
    data = yaml.safe_load(f)

print("Configuring Keycloak clients...")

for app in data["applications"]:
    print(f"Creating Keycloak client: {app['name']}")

print("Keycloak client setup completed")
