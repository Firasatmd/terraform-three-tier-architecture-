#getting DNS of load balancwer

output "lb_dns_name" {
  description = "DNS OF LOAD BALANCER"
  value       = aws_lb.external-alb.dns_name
}
