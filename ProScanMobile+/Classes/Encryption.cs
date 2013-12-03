using System;
using System.Text;
using System.Security.Cryptography;

namespace ProScanMobile
{
	public class Encryption
	{
		private const string TDES_KEY = "30a5SS3356430643uSEDB243";
		private const string TDES_IV = "524GD763";

		public Encryption ()
		{
		}

		public string Encrypt(string p)
		{
			TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider ();
			ICryptoTransform cTransform;

			byte[] toEncArray = UTF8Encoding.UTF8.GetBytes (p);
			byte[] keyArray = UTF8Encoding.UTF8.GetBytes (TDES_KEY);
			byte[] ivArray = UTF8Encoding.UTF8.GetBytes (TDES_IV);

			cTransform = tdes.CreateEncryptor (keyArray, ivArray);

			byte[] resultArray = cTransform.TransformFinalBlock (toEncArray, 0, toEncArray.Length);

			tdes.Clear ();

			return Convert.ToBase64String (resultArray, 0, resultArray.Length);
		}

		public string Decrypt(string p)
		{
			byte[] toEncArray = Convert.FromBase64String (p);

			TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider ();
			ICryptoTransform cTransform;

			byte[] keyArray = UTF8Encoding.UTF8.GetBytes (TDES_KEY);
			byte[] ivArray = UTF8Encoding.UTF8.GetBytes (TDES_IV);

			cTransform = tdes.CreateDecryptor (keyArray, ivArray);

			byte[] resultArray = cTransform.TransformFinalBlock (toEncArray, 0, toEncArray.Length);

			tdes.Clear ();

			return UTF8Encoding.UTF8.GetString(resultArray);
		}
	}
}

