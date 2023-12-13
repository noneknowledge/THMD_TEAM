using Amazon.S3.Transfer;
using Amazon.S3;
using Microsoft.AspNetCore.Mvc;
using System.Text;
using Amazon;
using Amazon.Runtime.Internal.Util;

namespace TMDT_Project.Models
{
    public class Mytool
    {
        public static string GetRandom(int length = 5)
        {
            var pattern = @"1234567890QAZWSXEDCRFVTGBYHNUJMIKLOPqazwsxedcrfvtgbyhn@#$%";
            var rd = new Random();
            var sb = new StringBuilder();
            for (int i = 0; i < length; i++)
                sb.Append(pattern[rd.Next(0, pattern.Length)]);

            return sb.ToString();
        }

        public static string UploadFileToFolder(IFormFile file, string folderName)
        {
            try
            {
                var fileName = $"{DateTime.Now.Ticks}_{file.FileName}";
                var fullPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "Hinh", folderName, fileName);
                using (var myFile = new FileStream(fullPath, FileMode.Create))
                {
                    file.CopyTo(myFile);
                }
                return fileName;
            }
            catch
            {
                return string.Empty;
            }
        }

        public static async Task<string> UploadFileToS3(IFormFile file)
        {
            // You can generate the 'access key id' and 'secret key id, when you create the IAM user in AWS.
            // Region endpoint should be same as the bucket region
            try
            {
                string accessKey = "AKIAWP6FQ7DT6XANL3U4";
                string secretKey = "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";
                string bucketName = "aspnetcore-ecommerce";
                string filename = $"{DateTime.Now.Ticks}_{file.FileName}";
                using (var amazonS3client = new AmazonS3Client(accessKey, secretKey, RegionEndpoint.APSoutheast1))
                {
                    
                    using (var memoryStream = new MemoryStream())
                    {
                        memoryStream.Position = 0;
                        Console.WriteLine(
                            "Capacity = {0}, Length = {1}, Position = {2}\n",
                            memoryStream.Capacity.ToString(),
                                                memoryStream.Length.ToString(),
                            memoryStream.Position.ToString());
                        // Copy file content to memory stream
                        await file.CopyToAsync(memoryStream);

                        // Create request with file name, bucket name and file content/memory stream
                        var request = new TransferUtilityUploadRequest
                        {
                            InputStream = memoryStream,
                            // File name
                            Key = filename,
                            // S3 bucket name
                            BucketName = bucketName,
                            // File content type
                            ContentType = file.ContentType
                        };

                        var transferUtility = new TransferUtility(amazonS3client);
                        await transferUtility.UploadAsync(request);
                        filename = request.Key;
                    }
                    return filename;
                }
                

                
            }

            catch
            {
                return string.Empty;
            }

        }
    }
}
