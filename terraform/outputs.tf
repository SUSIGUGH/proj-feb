output "masterpubip" {
  value = aws_instance.kub-master.private_ip  
}
output "workerpubip" {
  value = aws_instance.kub-worker1.private_ip  
}
