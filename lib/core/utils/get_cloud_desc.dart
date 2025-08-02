String getCloudDescription(int cloud) {
  if (cloud == 0) return "Cielo despejado";
  if (cloud <= 25) return "Pocas nubes";
  if (cloud <= 50) return "Parcialmente nublado";
  if (cloud <= 75) return "Mayormente nublado";
  if (cloud < 100) return "Muy nublado";
  return "Completamente nublado";
}
