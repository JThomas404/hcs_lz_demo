# Placeholder policy file.
#
# Planned checks for this file:
# - Identify security group rule resources in Terraform plan JSON.
# - Detect egress rules that allow outbound traffic to 0.0.0.0/0.
# - Return deny messages for any public egress rule.
# - Support both full Terraform plan payloads and simplified fallback payloads.