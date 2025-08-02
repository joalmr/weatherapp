String getUvDescription(double cloud) {
  if (cloud <= 2) return "Bajo";
  if (cloud <= 5) return "Moderado";
  if (cloud <= 7) return "Alto";
  if (cloud <= 10) return "Muy Alto";
  if (cloud > 11) return "Extremo";
  return "Riesgo extremo";
}
