output "cluster_id" {
  description = "The name/id of the EKS cluster"
  value       = aws_eks_cluster.main.id
}

output "cluster_endpoint" {
  description = "The endpoint for the EKS cluster"
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_security_group_id" {
  description = "Security group ID attached to the EKS cluster"
  value       = aws_security_group.eks_cluster.id
}

output "cluster_iam_role_name" {
  description = "IAM role name for the EKS cluster"
  value       = aws_iam_role.eks_cluster.name
}

output "cluster_iam_role_arn" {
  description = "IAM role ARN for the EKS cluster"
  value       = aws_iam_role.eks_cluster.arn
}

output "node_iam_role_name" {
  description = "IAM role name for the EKS worker nodes"
  value       = aws_iam_role.eks_node.name
}

output "node_iam_role_arn" {
  description = "IAM role ARN for the EKS worker nodes"
  value       = aws_iam_role.eks_node.arn
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = aws_eks_cluster.main.certificate_authority[0].data
} 