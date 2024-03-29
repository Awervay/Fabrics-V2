using Microsoft.VisualStudio.TestTools.UnitTesting;
using SF2022User_NN_Lib.dll;
using System;

namespace UnitTests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void The_consultation_time_is_30_minutes()
        {
            //Arrange
            TimeSpan[] startTimes = { TimeSpan.FromHours(9), TimeSpan.FromHours(12), TimeSpan.FromHours(15) };
            int[] durations = { 60, 30, 45 };
            TimeSpan beginWorkingTime = TimeSpan.FromHours(9);
            TimeSpan endWorkingTime = TimeSpan.FromHours(18);
            int consultationTime = 30;
            //Act
            string[] result = Calculations.AvailablePeriods(startTimes, durations, beginWorkingTime, endWorkingTime, consultationTime);
            //Assert
            Assert.AreEqual("11:30 - 12:00", result[0]);
        }

        [TestMethod]
        public void Not_enough_time_for_consultation()
        {
            //Arrange
            TimeSpan[] startTimes = { TimeSpan.FromHours(9), TimeSpan.FromHours(12), TimeSpan.FromHours(15) };
            int[] durations = { 60, 30, 45 };
            TimeSpan beginWorkingTime = TimeSpan.FromHours(9);
            TimeSpan endWorkingTime = TimeSpan.FromHours(18);
            int consultationTime = 20;
            //Act
            string[] result = Calculations.AvailablePeriods(startTimes, durations, beginWorkingTime, endWorkingTime, consultationTime);
            //Assert
            Assert.AreEqual("11:40 - 12:00", result[0]);
        }

        [TestMethod]
        public void AvailablePeriods_NoOverlap_ReturnsCorrectPeriods()
        {
            //Arrange
            TimeSpan[] startTimes = new TimeSpan[] { TimeSpan.FromHours(9), TimeSpan.FromHours(13) };
            int[] durations = new int[] { 60, 30 };
            TimeSpan beginWorkingTime = TimeSpan.FromHours(9);
            TimeSpan endWorkingTime = TimeSpan.FromHours(16);
            int consultationTime = 15;
            //Act
            string[] result = Calculations.AvailablePeriods(startTimes, durations, beginWorkingTime, endWorkingTime, consultationTime);
            //Assert
            CollectionAssert.AreEqual(new string[] { "08:00 - 09:00", "09:15 - 13:00", "13:30 - 16:00" }, result);
        }

        [TestMethod]
        public void AvailablePeriods_Overlap_ReturnsCorrectPeriods()
        {
            //Arrange
            TimeSpan[] startTimes = new TimeSpan[] { TimeSpan.FromHours(9), TimeSpan.FromHours(10) };
            int[] durations = new int[] { 60, 30 };
            TimeSpan beginWorkingTime = TimeSpan.FromHours(8);
            TimeSpan endWorkingTime = TimeSpan.FromHours(12);
            int consultationTime = 15;
            //Act
            string[] result = Calculations.AvailablePeriods(startTimes, durations, beginWorkingTime, endWorkingTime, consultationTime);
            //Assert
            CollectionAssert.AreEqual(new string[] { "08:00 - 09:00" }, result);
        }

        [TestMethod]
        public void AvailablePeriods_NoAvailablePeriods_ReturnsEmptyArray()
        {
            //Arrange
            TimeSpan[] startTimes = new TimeSpan[] { TimeSpan.Parse("09:00"), TimeSpan.Parse("10:00") };
            int[] durations = new int[] { 60, 30 };
            TimeSpan beginWorkingTime = TimeSpan.Parse("08:00");
            TimeSpan endWorkingTime = TimeSpan.Parse("09:30");
            int consultationTime = 15;
            //Act
            string[] result = Calculations.AvailablePeriods(startTimes, durations, beginWorkingTime, endWorkingTime, consultationTime);
            //Assert
            Assert.AreEqual(1, result.Length);
        }

        [TestMethod]
        public void AvailablePeriods_NoBusyPeriods_ReturnsFullWorkingTime()
        {
            //Arrange
            TimeSpan[] startTimes = new TimeSpan[] { };
            int[] durations = new int[] { };
            TimeSpan beginWorkingTime = TimeSpan.Parse("08:00");
            TimeSpan endWorkingTime = TimeSpan.Parse("16:00");
            int consultationTime = 15;
            //Act
            string[] result = Calculations.AvailablePeriods(startTimes, durations, beginWorkingTime, endWorkingTime, consultationTime);
            //Assert
            CollectionAssert.AreEqual(new string[] { "08:00 - 16:00" }, result);
        }

        [TestMethod]
        public void AvailablePeriods_ConsultationTimeGreaterThanWorkingTime_ReturnsEmptyArray()
        {
            //Arrange
            TimeSpan[] startTimes = new TimeSpan[] { TimeSpan.Parse("09:00") };
            int[] durations = new int[] { 60 };
            TimeSpan beginWorkingTime = TimeSpan.Parse("08:00");
            TimeSpan endWorkingTime = TimeSpan.Parse("16:00");
            int consultationTime = 120;
            //Act
            string[] result = Calculations.AvailablePeriods(startTimes, durations, beginWorkingTime, endWorkingTime, consultationTime);
            //Assert
            Assert.AreEqual(1, result.Length);
        }

        [TestMethod]
        public void Test_AvailablePeriods_WithEmptyInput()
        {
            //Arrange
            TimeSpan[] startTimes = new TimeSpan[] { };
            int[] durations = new int[] { };
            TimeSpan beginWorkingTime = new TimeSpan(9, 0, 0);
            TimeSpan endWorkingTime = new TimeSpan(18, 0, 0);
            int consultationTime = 30;
            //Act
            string[] expected = new string[] { };
            string[] actual = Calculations.AvailablePeriods(startTimes, durations, beginWorkingTime, endWorkingTime, consultationTime);
            //Assert
            Assert.AreEqual(expected, actual);
        }

        [TestMethod]
        public void TestAvailablePeriodsWithOneFreePeriodAtEndOfDay()
        {
            //Arrange
            TimeSpan[] startTimes = new TimeSpan[] { new TimeSpan(9, 0, 0), new TimeSpan(10, 0, 0) };
            int[] durations = new int[] { 30, 30 };
            TimeSpan beginWorkingTime = new TimeSpan(9, 0, 0);
            TimeSpan endWorkingTime = new TimeSpan(18, 0, 0);
            int consultationTime = 30;
            //Act
            string[] result = Calculations.AvailablePeriods(startTimes, durations, beginWorkingTime, endWorkingTime, consultationTime);
            //Assert
            CollectionAssert.AreEqual(new string[] { "13:00 - 18:00" }, result);
        }

        [TestMethod]
        public void TestAvailablePeriods_OverlappingStartEndWorkingTime()
        {
            //Arrange
            TimeSpan[] startTimes = { new TimeSpan(8, 30, 0), new TimeSpan(17, 0, 0) };
            int[] durations = { 90, 30 };
            TimeSpan beginWorkingTime = new TimeSpan(9, 0, 0);
            TimeSpan endWorkingTime = new TimeSpan(18, 0, 0);
            int consultationTime = 30;
            //Act
            string[] expected = { "09:00 - 09:30" };
            string[] result = Calculations.AvailablePeriods(startTimes, durations, beginWorkingTime, endWorkingTime, consultationTime);
            //Assert
            CollectionAssert.AreEqual(expected, result);
        }
    }
}
