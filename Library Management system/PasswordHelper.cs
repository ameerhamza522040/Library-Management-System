using BCrypt.Net;

namespace Library_Management_system
{
    public static class PasswordHelper
    {
        // Call this when saving a NEW password (registration, admin creating/editing a student)
        public static string Hash(string plainTextPassword)
        {
            return BCrypt.Net.BCrypt.HashPassword(plainTextPassword);
        }

        // Call this when checking a LOGIN attempt against a stored hash
        public static bool Verify(string plainTextPassword, string storedHash)
        {
            return BCrypt.Net.BCrypt.Verify(plainTextPassword, storedHash);
        }
    }
}