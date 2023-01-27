resource "aws_route" "routeIGW" {
  route_table_id            = aws_vpc.myteravpc.main_route_table_id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.gw.id
}