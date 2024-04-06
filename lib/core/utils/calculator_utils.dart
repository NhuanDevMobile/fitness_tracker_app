class CalculatorUtils {
  static List<String> calculateBMI(
      int weight, int height, int age, String gender) {
    double bmi;
    String result;

    // Chuyển đổi chiều cao từ cm thành m
    double heightInMeter = height / 100;

    // Tính chỉ số BMI
    bmi = weight / (heightInMeter * heightInMeter);
    if (bmi < 18.5) {
      result = "Underweight";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      result = "Normal weight";
    } else if (bmi >= 24.9 && bmi < 29.9) {
      result = "Overweight";
    } else if (bmi >= 29.9 && bmi < 34.9) {
      result = "Obesity (Class 1)";
    } else if (bmi >= 34.9 && bmi < 39.9) {
      result = "Obesity (Class 2)";
    } else {
      result = "Obesity (Class 3)";
    }
    return [" ${bmi.toStringAsFixed(2)}", result];
  }

  static List<double> calculateHealthyWeight(int height) {
    double heightInCM = height - 100;
    double idealWeight = (heightInCM * 9) / 10; // Cân nặng lý tưởng
    double maxWeight = heightInCM; // Mức cân tối đa
    double minWeight = (heightInCM * 8) / 10; // Mức cân tối thiểu

    return [idealWeight, maxWeight, minWeight];
  }
}
