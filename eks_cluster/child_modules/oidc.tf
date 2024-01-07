data "tls_certificate" "eks_cluster" {
  url = aws_eks_cluster.eks_cluster[0].identity.0.oidc.0.issuer
}

resource "aws_iam_openid_connect_provider" "eks_oidc" {
    url = aws_eks_cluster.eks_cluster[0].identity.0.oidc.0.issuer
    client_id_list = [ "sts.amazonaws.com" ]
    thumbprint_list = concat([data.tls_certificate.eks_cluster.certificates.0.sha1_fingerprint])
}

