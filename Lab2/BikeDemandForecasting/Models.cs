using System;

namespace BikeDemandForecasting
{
    public class ModelInput
    {
        public DateTime RentalDate { get; set; }
        public float Year { get; set; }
        public float TotalRentals { get; set; }
    }

    public class ModelOutput
    {
        public float[] ForecastedRentals { get; set; }
        public float[] LowerBoundRentals { get; set; }
        public float[] UpperBoundRentals { get; set; }
    }
}
