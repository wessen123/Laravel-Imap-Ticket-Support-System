-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220227.3a51491d8f
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 28, 2022 at 08:26 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lara123`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(10) UNSIGNED DEFAULT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `description`, `subject_id`, `subject_type`, `user_id`, `properties`, `host`, `created_at`, `updated_at`) VALUES
(1, 'created', 1, 'App\\Ticket', 1, '{\"uid\":\"646\",\"title\":{},\"author_email\":\"jobalerts-noreply@linkedin.com\",\"content\":\"LinkedIn | Your job alert for virtual assistant in United States\\r\\n\\r\\n13 new jobs match your preferences.\\r\\n\\r\\n---------------------------------------------------------\\r\\n\\r\\nVirtual Assistant\\r\\nHousecall Pro\\r\\nOrlando, Florida, United States\\r\\n\\r\\nView job: https:\\/\\/www.linkedin.com\\/comm\\/jobs\\/view\\/2939726139?alertAction=markasviewed&savedSearchAuthToken=1%26AQF2007gvSCxNQAAAX_FrxMSspihbHTv7GTthGy94V4g4loVRVaoKoqLP_99aj0hf6IknNXAYP7SYVwKWtil-E2csDJcoYpCPEDDeXzzWFkeOr84kKnsgvWvEdqvw0Zyk4PPD7diEHNWn1Htc7Plq_co_kDl7xyhuEWyV1FDOUUwZmiswcoBa5y2ERhD8AeJLR8fo0k9fjhpW0ZqaWpRQvlrIyxzKZqcvfVqtiAoL8aftkPrc8fVRsnVHwtA6vedL9El6I3rb3htRsl4rvyX4wgGT0XVqnctw1cIxSABPzWiv_icW_A_08sg%26AaWY0esyAlLLLG4cT7z6YJu9NlkA&savedSearchId=1724366381&refId=b5eea3fa-0df2-4193-a8c1-0adbe266a2a1&trackingId=SimRaEiN6mYKg7vMHu%2FlzA%3D%3D&midToken=AQF9hBFhhpEyow&midSig=3bhy7d0D5YbGc1&trk=eml-email_job_alert_digest_01-job_alert-6-member_details_mercado&trkEmail=eml-email_job_alert_digest_01-job_alert-6-member_details_mercado-null-fpeape%7El17oqxz5%7Er7-null-jobs%7Eview&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3Bz9zdR7%2BsQnGG%2BD8B84VOpw%3D%3D\\r\\n\\r\\n---------------------------------------------------------\\r\\n\\r\\nVirtual Assistant Director Training\\r\\nTalentify.io\\r\\nUnited States\\r\\n\\r\\nView job: https:\\/\\/www.linkedin.com\\/comm\\/jobs\\/view\\/2984866540?alertAction=markasviewed&savedSearchAuthToken=1%26AQF2007gvSCxNQAAAX_FrxMSspihbHTv7GTthGy94V4g4loVRVaoKoqLP_99aj0hf6IknNXAYP7SYVwKWtil-E2csDJcoYpCPEDDeXzzWFkeOr84kKnsgvWvEdqvw0Zyk4PPD7diEHNWn1Htc7Plq_co_kDl7xyhuEWyV1FDOUUwZmiswcoBa5y2ERhD8AeJLR8fo0k9fjhpW0ZqaWpRQvlrIyxzKZqcvfVqtiAoL8aftkPrc8fVRsnVHwtA6vedL9El6I3rb3htRsl4rvyX4wgGT0XVqnctw1cIxSABPzWiv_icW_A_08sg%26AaWY0esyAlLLLG4cT7z6YJu9NlkA&savedSearchId=1724366381&refId=b5eea3fa-0df2-4193-a8c1-0adbe266a2a1&trackingId=B2t3%2B6FSHGS8r%2B%2BTkYlVBQ%3D%3D&midToken=AQF9hBFhhpEyow&midSig=3bhy7d0D5YbGc1&trk=eml-email_job_alert_digest_01-job_alert-7-member_details_mercado&trkEmail=eml-email_job_alert_digest_01-job_alert-7-member_details_mercado-null-fpeape%7El17oqxz5%7Er7-null-jobs%7Eview&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3Bz9zdR7%2BsQnGG%2BD8B84VOpw%3D%3D\\r\\n\\r\\n---------------------------------------------------------\\r\\n\\r\\nVirtual Assistant Principal\\r\\nPhalen Leadership Academies\\r\\nIndiana, United States\\r\\n\\r\\nView job: https:\\/\\/www.linkedin.com\\/comm\\/jobs\\/view\\/2990860385?alertAction=markasviewed&savedSearchAuthToken=1%26AQF2007gvSCxNQAAAX_FrxMSspihbHTv7GTthGy94V4g4loVRVaoKoqLP_99aj0hf6IknNXAYP7SYVwKWtil-E2csDJcoYpCPEDDeXzzWFkeOr84kKnsgvWvEdqvw0Zyk4PPD7diEHNWn1Htc7Plq_co_kDl7xyhuEWyV1FDOUUwZmiswcoBa5y2ERhD8AeJLR8fo0k9fjhpW0ZqaWpRQvlrIyxzKZqcvfVqtiAoL8aftkPrc8fVRsnVHwtA6vedL9El6I3rb3htRsl4rvyX4wgGT0XVqnctw1cIxSABPzWiv_icW_A_08sg%26AaWY0esyAlLLLG4cT7z6YJu9NlkA&savedSearchId=1724366381&refId=b5eea3fa-0df2-4193-a8c1-0adbe266a2a1&trackingId=4H4i0TolRf6xJvifZbvyZQ%3D%3D&midToken=AQF9hBFhhpEyow&midSig=3bhy7d0D5YbGc1&trk=eml-email_job_alert_digest_01-job_alert-8-member_details_mercado&trkEmail=eml-email_job_alert_digest_01-job_alert-8-member_details_mercado-null-fpeape%7El17oqxz5%7Er7-null-jobs%7Eview&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3Bz9zdR7%2BsQnGG%2BD8B84VOpw%3D%3D\\r\\n\\r\\n---------------------------------------------------------\\r\\n\\r\\nSALES VIRTUAL ASSISTANT\\r\\nTalentify.io\\r\\nUnited States\\r\\n\\r\\nView job: https:\\/\\/www.linkedin.com\\/comm\\/jobs\\/view\\/2984865508?alertAction=markasviewed&savedSearchAuthToken=1%26AQF2007gvSCxNQAAAX_FrxMSspihbHTv7GTthGy94V4g4loVRVaoKoqLP_99aj0hf6IknNXAYP7SYVwKWtil-E2csDJcoYpCPEDDeXzzWFkeOr84kKnsgvWvEdqvw0Zyk4PPD7diEHNWn1Htc7Plq_co_kDl7xyhuEWyV1FDOUUwZmiswcoBa5y2ERhD8AeJLR8fo0k9fjhpW0ZqaWpRQvlrIyxzKZqcvfVqtiAoL8aftkPrc8fVRsnVHwtA6vedL9El6I3rb3htRsl4rvyX4wgGT0XVqnctw1cIxSABPzWiv_icW_A_08sg%26AaWY0esyAlLLLG4cT7z6YJu9NlkA&savedSearchId=1724366381&refId=b5eea3fa-0df2-4193-a8c1-0adbe266a2a1&trackingId=LZ1lCn2X0%2Fh%2F0dEFCkofkw%3D%3D&midToken=AQF9hBFhhpEyow&midSig=3bhy7d0D5YbGc1&trk=eml-email_job_alert_digest_01-job_alert-9-member_details_mercado&trkEmail=eml-email_job_alert_digest_01-job_alert-9-member_details_mercado-null-fpeape%7El17oqxz5%7Er7-null-jobs%7Eview&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3Bz9zdR7%2BsQnGG%2BD8B84VOpw%3D%3D\\r\\n\\r\\n---------------------------------------------------------\\r\\n\\r\\nVIRTUAL ASSISTANT\\r\\nSMC Global, a Special Materials Company\\r\\nTad, West Virginia, United States\\r\\n\\r\\nView job: https:\\/\\/www.linkedin.com\\/comm\\/jobs\\/view\\/2991261625?alertAction=markasviewed&savedSearchAuthToken=1%26AQF2007gvSCxNQAAAX_FrxMSspihbHTv7GTthGy94V4g4loVRVaoKoqLP_99aj0hf6IknNXAYP7SYVwKWtil-E2csDJcoYpCPEDDeXzzWFkeOr84kKnsgvWvEdqvw0Zyk4PPD7diEHNWn1Htc7Plq_co_kDl7xyhuEWyV1FDOUUwZmiswcoBa5y2ERhD8AeJLR8fo0k9fjhpW0ZqaWpRQvlrIyxzKZqcvfVqtiAoL8aftkPrc8fVRsnVHwtA6vedL9El6I3rb3htRsl4rvyX4wgGT0XVqnctw1cIxSABPzWiv_icW_A_08sg%26AaWY0esyAlLLLG4cT7z6YJu9NlkA&savedSearchId=1724366381&refId=b5eea3fa-0df2-4193-a8c1-0adbe266a2a1&trackingId=ereSzfJsF9vXFyNl4wiczg%3D%3D&midToken=AQF9hBFhhpEyow&midSig=3bhy7d0D5YbGc1&trk=eml-email_job_alert_digest_01-job_alert-10-member_details_mercado&trkEmail=eml-email_job_alert_digest_01-job_alert-10-member_details_mercado-null-fpeape%7El17oqxz5%7Er7-null-jobs%7Eview&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3Bz9zdR7%2BsQnGG%2BD8B84VOpw%3D%3D\\r\\n\\r\\n---------------------------------------------------------\\r\\n\\r\\nVIRTUAL ASSISTANT\\r\\nSMC Global, a Special Materials Company\\r\\nRex, Georgia, United States\\r\\n\\r\\nView job: https:\\/\\/www.linkedin.com\\/comm\\/jobs\\/view\\/2991266105?alertAction=markasviewed&savedSearchAuthToken=1%26AQF2007gvSCxNQAAAX_FrxMSspihbHTv7GTthGy94V4g4loVRVaoKoqLP_99aj0hf6IknNXAYP7SYVwKWtil-E2csDJcoYpCPEDDeXzzWFkeOr84kKnsgvWvEdqvw0Zyk4PPD7diEHNWn1Htc7Plq_co_kDl7xyhuEWyV1FDOUUwZmiswcoBa5y2ERhD8AeJLR8fo0k9fjhpW0ZqaWpRQvlrIyxzKZqcvfVqtiAoL8aftkPrc8fVRsnVHwtA6vedL9El6I3rb3htRsl4rvyX4wgGT0XVqnctw1cIxSABPzWiv_icW_A_08sg%26AaWY0esyAlLLLG4cT7z6YJu9NlkA&savedSearchId=1724366381&refId=b5eea3fa-0df2-4193-a8c1-0adbe266a2a1&trackingId=xlP9%2BFCl9%2FDMYBQIOeoREw%3D%3D&midToken=AQF9hBFhhpEyow&midSig=3bhy7d0D5YbGc1&trk=eml-email_job_alert_digest_01-job_alert-11-member_details_mercado&trkEmail=eml-email_job_alert_digest_01-job_alert-11-member_details_mercado-null-fpeape%7El17oqxz5%7Er7-null-jobs%7Eview&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3Bz9zdR7%2BsQnGG%2BD8B84VOpw%3D%3D\\r\\n\\r\\n---------------------------------------------------------\\r\\n\\r\\n\\r\\n---------------------------------------------------------\\r\\nSee jobs where you\'re a top applicant\\r\\n\\r\\nTry Premium for free: https:\\/\\/www.linkedin.com\\/comm\\/premium\\/products\\/?family=jss&midToken=AQF9hBFhhpEyow&midSig=3bhy7d0D5YbGc1&trk=eml-email_job_alert_digest_01-job_alert-19-premium_upsell_top_applicant_mercado&trkEmail=eml-email_job_alert_digest_01-job_alert-19-premium_upsell_top_applicant_mercado-null-fpeape%7El17oqxz5%7Er7-null-neptune%2Fpremium%2Eproducts&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3Bz9zdR7%2BsQnGG%2BD8B84VOpw%3D%3D\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n.....................................\\r\\n\\r\\nManage your job alerts: https:\\/\\/www.linkedin.com\\/comm\\/jobs\\/alerts?midToken=AQF9hBFhhpEyow&amp;midSig=3bhy7d0D5YbGc1&amp;trk=eml-email_job_alert_digest_01-footer-17-manage_alert&amp;trkEmail=eml-email_job_alert_digest_01-footer-17-manage_alert-null-fpeape%7El17oqxz5%7Er7-null-job%7Ealert%7Emanager&amp;lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3Bz9zdR7%2BsQnGG%2BD8B84VOpw%3D%3D\\r\\n\\r\\nUnsubscribe: https:\\/\\/www.linkedin.com\\/e\\/v2?e=fpeape-l17oqxz5-r7&amp;lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3Bz9zdR7%2BsQnGG%2BD8B84VOpw%3D%3D&amp;a=jobs-jserp-search-mirror&amp;midToken=AQF9hBFhhpEyow&amp;midSig=3bhy7d0D5YbGc1&amp;ek=email_job_alert_digest_01&amp;li=18&amp;m=footer&amp;ts=delete_alert&amp;alertAction=delete&amp;savedSearchId=1724366381\\r\\n\\r\\nHelp: https:\\/\\/www.linkedin.com\\/e\\/v2?e=fpeape-l17oqxz5-r7&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3Bz9zdR7%2BsQnGG%2BD8B84VOpw%3D%3D&a=customerServiceUrl&midToken=AQF9hBFhhpEyow&midSig=3bhy7d0D5YbGc1&ek=email_job_alert_digest_01&li=43&m=footer&ts=help&articleId=67\\r\\n\\r\\n\\r\\nYou are receiving LinkedIn notification emails.\\r\\n\\r\\nThis email was intended for Wondwessen Haile (Virtual Assistant at ISREAL).\\r\\nLearn why we included this: https:\\/\\/www.linkedin.com\\/e\\/v2?e=fpeape-l17oqxz5-r7&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3Bz9zdR7%2BsQnGG%2BD8B84VOpw%3D%3D&a=customerServiceUrl&midToken=AQF9hBFhhpEyow&midSig=3bhy7d0D5YbGc1&ek=email_job_alert_digest_01&articleId=4788\\r\\n\\r\\n\\u00a9 2022 LinkedIn Ireland Unlimited Company, Wilton Plaza, Wilton Place, Dublin 2. LinkedIn is a registered business name of LinkedIn Ireland Unlimited Company. LinkedIn and the LinkedIn logo are registered trademarks of LinkedIn.\\n\",\"created_at\":\"2022-03-26T10:04:19.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T19:55:00.000000Z\",\"id\":1,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 16:55:00', '2022-03-27 16:55:00'),
(2, 'created', 2, 'App\\Ticket', 1, '{\"uid\":\"647\",\"title\":{},\"author_email\":\"jobalerts-noreply@linkedin.com\",\"content\":\"LinkedIn | Your job alert for ecommerce manager in United States\\r\\n\\r\\n22 new jobs match your preferences.\\r\\n\\r\\n---------------------------------------------------------\\r\\n\\r\\nEcommerce Manager\\r\\nCSG Talent\\r\\nVirgin, Utah, United States\\r\\n\\r\\nView job: https:\\/\\/www.linkedin.com\\/comm\\/jobs\\/view\\/2984824008?alertAction=markasviewed&savedSearchAuthToken=1%26AQGfaueOLw6VOwAAAX_FsfJ4pH4_fJL2-yuEe1T_uIBXsE8RnKEvnZ4tfVMwStR7e4w_5GG9mKNsu3Rm3GkFex94Ri38GCjyf_8d_O4i5OyFQwVpz3rQMV5BLGqKam0wV3BRayk06Dfu8F7ME-DUpeid0N4tcNHEVPJEQebarYG4R1R2qThJiFxyJwTONVh2gSZnNIkiW_bL6AoFtG6ySgdkNcU--q0f4iy7nqePn9D1MY0mM1A-k2ajwcUC6qa6vxinOk-pUvd9yG0E0nmce_mMnVk8wejmEi55YcjavG_CM-BElF7_5-yN%26AY9upJFzX81RYsViJl2ikkF3X1M_&savedSearchId=1724366389&refId=576a0dbf-ae0f-4e48-9bf2-d7f25b19a110&trackingId=bOb0ABmlDCHLP1AxuKi1jg%3D%3D&midToken=AQF9hBFhhpEyow&midSig=2VfL4OtVV_bGc1&trk=eml-email_job_alert_digest_01-job_alert-6-member_details_mercado&trkEmail=eml-email_job_alert_digest_01-job_alert-6-member_details_mercado-null-fpeape%7El17oqxoi%7Et0-null-jobs%7Eview&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3B50a5BsYySVK9QpDX%2BBO7yQ%3D%3D\\r\\n\\r\\n---------------------------------------------------------\\r\\n\\r\\nEcommerce Product Manager\\r\\nLUS Brands\\r\\nUnited States\\r\\n\\r\\nView job: https:\\/\\/www.linkedin.com\\/comm\\/jobs\\/view\\/2983189711?alertAction=markasviewed&savedSearchAuthToken=1%26AQGfaueOLw6VOwAAAX_FsfJ4pH4_fJL2-yuEe1T_uIBXsE8RnKEvnZ4tfVMwStR7e4w_5GG9mKNsu3Rm3GkFex94Ri38GCjyf_8d_O4i5OyFQwVpz3rQMV5BLGqKam0wV3BRayk06Dfu8F7ME-DUpeid0N4tcNHEVPJEQebarYG4R1R2qThJiFxyJwTONVh2gSZnNIkiW_bL6AoFtG6ySgdkNcU--q0f4iy7nqePn9D1MY0mM1A-k2ajwcUC6qa6vxinOk-pUvd9yG0E0nmce_mMnVk8wejmEi55YcjavG_CM-BElF7_5-yN%26AY9upJFzX81RYsViJl2ikkF3X1M_&savedSearchId=1724366389&refId=576a0dbf-ae0f-4e48-9bf2-d7f25b19a110&trackingId=ubqDSXsLDMxjWkDdU6YQLw%3D%3D&midToken=AQF9hBFhhpEyow&midSig=2VfL4OtVV_bGc1&trk=eml-email_job_alert_digest_01-job_alert-7-member_details_mercado&trkEmail=eml-email_job_alert_digest_01-job_alert-7-member_details_mercado-null-fpeape%7El17oqxoi%7Et0-null-jobs%7Eview&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3B50a5BsYySVK9QpDX%2BBO7yQ%3D%3D\\r\\n\\r\\n---------------------------------------------------------\\r\\n\\r\\nBrowse & Search Ecommerce Manager\\r\\nNeiman Marcus Group\\r\\nIrving, Texas, United States\\r\\n\\r\\nView job: https:\\/\\/www.linkedin.com\\/comm\\/jobs\\/view\\/2745464037?alertAction=markasviewed&savedSearchAuthToken=1%26AQGfaueOLw6VOwAAAX_FsfJ4pH4_fJL2-yuEe1T_uIBXsE8RnKEvnZ4tfVMwStR7e4w_5GG9mKNsu3Rm3GkFex94Ri38GCjyf_8d_O4i5OyFQwVpz3rQMV5BLGqKam0wV3BRayk06Dfu8F7ME-DUpeid0N4tcNHEVPJEQebarYG4R1R2qThJiFxyJwTONVh2gSZnNIkiW_bL6AoFtG6ySgdkNcU--q0f4iy7nqePn9D1MY0mM1A-k2ajwcUC6qa6vxinOk-pUvd9yG0E0nmce_mMnVk8wejmEi55YcjavG_CM-BElF7_5-yN%26AY9upJFzX81RYsViJl2ikkF3X1M_&savedSearchId=1724366389&refId=576a0dbf-ae0f-4e48-9bf2-d7f25b19a110&trackingId=jJTaWA6J99VzAU544s9TGw%3D%3D&midToken=AQF9hBFhhpEyow&midSig=2VfL4OtVV_bGc1&trk=eml-email_job_alert_digest_01-job_alert-8-member_details_mercado&trkEmail=eml-email_job_alert_digest_01-job_alert-8-member_details_mercado-null-fpeape%7El17oqxoi%7Et0-null-jobs%7Eview&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3B50a5BsYySVK9QpDX%2BBO7yQ%3D%3D\\r\\n\\r\\n---------------------------------------------------------\\r\\n\\r\\nInsomniac - Ecommerce Manager, Apparel\\r\\nInsomniac Events\\r\\nLos Angeles, California, United States\\r\\n\\r\\nView job: https:\\/\\/www.linkedin.com\\/comm\\/jobs\\/view\\/2983188653?alertAction=markasviewed&savedSearchAuthToken=1%26AQGfaueOLw6VOwAAAX_FsfJ4pH4_fJL2-yuEe1T_uIBXsE8RnKEvnZ4tfVMwStR7e4w_5GG9mKNsu3Rm3GkFex94Ri38GCjyf_8d_O4i5OyFQwVpz3rQMV5BLGqKam0wV3BRayk06Dfu8F7ME-DUpeid0N4tcNHEVPJEQebarYG4R1R2qThJiFxyJwTONVh2gSZnNIkiW_bL6AoFtG6ySgdkNcU--q0f4iy7nqePn9D1MY0mM1A-k2ajwcUC6qa6vxinOk-pUvd9yG0E0nmce_mMnVk8wejmEi55YcjavG_CM-BElF7_5-yN%26AY9upJFzX81RYsViJl2ikkF3X1M_&savedSearchId=1724366389&refId=576a0dbf-ae0f-4e48-9bf2-d7f25b19a110&trackingId=qg%2FQ0wGtb68xY0zSqmCL9w%3D%3D&midToken=AQF9hBFhhpEyow&midSig=2VfL4OtVV_bGc1&trk=eml-email_job_alert_digest_01-job_alert-9-member_details_mercado&trkEmail=eml-email_job_alert_digest_01-job_alert-9-member_details_mercado-null-fpeape%7El17oqxoi%7Et0-null-jobs%7Eview&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3B50a5BsYySVK9QpDX%2BBO7yQ%3D%3D\\r\\n\\r\\n---------------------------------------------------------\\r\\n\\r\\nSite Merchandising, eCommerce Manager - Consumables\\r\\nWalmart\\r\\nHoboken, New Jersey, United States\\r\\n\\r\\nView job: https:\\/\\/www.linkedin.com\\/comm\\/jobs\\/view\\/2910621470?alertAction=markasviewed&savedSearchAuthToken=1%26AQGfaueOLw6VOwAAAX_FsfJ4pH4_fJL2-yuEe1T_uIBXsE8RnKEvnZ4tfVMwStR7e4w_5GG9mKNsu3Rm3GkFex94Ri38GCjyf_8d_O4i5OyFQwVpz3rQMV5BLGqKam0wV3BRayk06Dfu8F7ME-DUpeid0N4tcNHEVPJEQebarYG4R1R2qThJiFxyJwTONVh2gSZnNIkiW_bL6AoFtG6ySgdkNcU--q0f4iy7nqePn9D1MY0mM1A-k2ajwcUC6qa6vxinOk-pUvd9yG0E0nmce_mMnVk8wejmEi55YcjavG_CM-BElF7_5-yN%26AY9upJFzX81RYsViJl2ikkF3X1M_&savedSearchId=1724366389&refId=576a0dbf-ae0f-4e48-9bf2-d7f25b19a110&trackingId=6QHfa2LD7L13EnrwNqexjA%3D%3D&midToken=AQF9hBFhhpEyow&midSig=2VfL4OtVV_bGc1&trk=eml-email_job_alert_digest_01-job_alert-10-member_details_mercado&trkEmail=eml-email_job_alert_digest_01-job_alert-10-member_details_mercado-null-fpeape%7El17oqxoi%7Et0-null-jobs%7Eview&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3B50a5BsYySVK9QpDX%2BBO7yQ%3D%3D\\r\\n\\r\\n---------------------------------------------------------\\r\\n\\r\\neCommerce Account Manager\\r\\nThe Job Network\\r\\nDallas, Texas, United States\\r\\n\\r\\nView job: https:\\/\\/www.linkedin.com\\/comm\\/jobs\\/view\\/2983926655?alertAction=markasviewed&savedSearchAuthToken=1%26AQGfaueOLw6VOwAAAX_FsfJ4pH4_fJL2-yuEe1T_uIBXsE8RnKEvnZ4tfVMwStR7e4w_5GG9mKNsu3Rm3GkFex94Ri38GCjyf_8d_O4i5OyFQwVpz3rQMV5BLGqKam0wV3BRayk06Dfu8F7ME-DUpeid0N4tcNHEVPJEQebarYG4R1R2qThJiFxyJwTONVh2gSZnNIkiW_bL6AoFtG6ySgdkNcU--q0f4iy7nqePn9D1MY0mM1A-k2ajwcUC6qa6vxinOk-pUvd9yG0E0nmce_mMnVk8wejmEi55YcjavG_CM-BElF7_5-yN%26AY9upJFzX81RYsViJl2ikkF3X1M_&savedSearchId=1724366389&refId=576a0dbf-ae0f-4e48-9bf2-d7f25b19a110&trackingId=G0n3P3aW6aw7ciW74pwaYg%3D%3D&midToken=AQF9hBFhhpEyow&midSig=2VfL4OtVV_bGc1&trk=eml-email_job_alert_digest_01-job_alert-11-member_details_mercado&trkEmail=eml-email_job_alert_digest_01-job_alert-11-member_details_mercado-null-fpeape%7El17oqxoi%7Et0-null-jobs%7Eview&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3B50a5BsYySVK9QpDX%2BBO7yQ%3D%3D\\r\\n\\r\\n---------------------------------------------------------\\r\\n\\r\\n\\r\\n---------------------------------------------------------\\r\\nSee jobs where you\'re a top applicant\\r\\n\\r\\nTry Premium for free: https:\\/\\/www.linkedin.com\\/comm\\/premium\\/products\\/?family=jss&midToken=AQF9hBFhhpEyow&midSig=2VfL4OtVV_bGc1&trk=eml-email_job_alert_digest_01-job_alert-19-premium_upsell_top_applicant_mercado&trkEmail=eml-email_job_alert_digest_01-job_alert-19-premium_upsell_top_applicant_mercado-null-fpeape%7El17oqxoi%7Et0-null-neptune%2Fpremium%2Eproducts&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3B50a5BsYySVK9QpDX%2BBO7yQ%3D%3D\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n.....................................\\r\\n\\r\\nManage your job alerts: https:\\/\\/www.linkedin.com\\/comm\\/jobs\\/alerts?midToken=AQF9hBFhhpEyow&amp;midSig=2VfL4OtVV_bGc1&amp;trk=eml-email_job_alert_digest_01-footer-17-manage_alert&amp;trkEmail=eml-email_job_alert_digest_01-footer-17-manage_alert-null-fpeape%7El17oqxoi%7Et0-null-job%7Ealert%7Emanager&amp;lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3B50a5BsYySVK9QpDX%2BBO7yQ%3D%3D\\r\\n\\r\\nUnsubscribe: https:\\/\\/www.linkedin.com\\/e\\/v2?e=fpeape-l17oqxoi-t0&amp;lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3B50a5BsYySVK9QpDX%2BBO7yQ%3D%3D&amp;a=jobs-jserp-search-mirror&amp;midToken=AQF9hBFhhpEyow&amp;midSig=2VfL4OtVV_bGc1&amp;ek=email_job_alert_digest_01&amp;li=18&amp;m=footer&amp;ts=delete_alert&amp;alertAction=delete&amp;savedSearchId=1724366389\\r\\n\\r\\nHelp: https:\\/\\/www.linkedin.com\\/e\\/v2?e=fpeape-l17oqxoi-t0&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3B50a5BsYySVK9QpDX%2BBO7yQ%3D%3D&a=customerServiceUrl&midToken=AQF9hBFhhpEyow&midSig=2VfL4OtVV_bGc1&ek=email_job_alert_digest_01&li=43&m=footer&ts=help&articleId=67\\r\\n\\r\\n\\r\\nYou are receiving LinkedIn notification emails.\\r\\n\\r\\nThis email was intended for Wondwessen Haile (Virtual Assistant at ISREAL).\\r\\nLearn why we included this: https:\\/\\/www.linkedin.com\\/e\\/v2?e=fpeape-l17oqxoi-t0&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3B50a5BsYySVK9QpDX%2BBO7yQ%3D%3D&a=customerServiceUrl&midToken=AQF9hBFhhpEyow&midSig=2VfL4OtVV_bGc1&ek=email_job_alert_digest_01&articleId=4788\\r\\n\\r\\n\\u00a9 2022 LinkedIn Ireland Unlimited Company, Wilton Plaza, Wilton Place, Dublin 2. LinkedIn is a registered business name of LinkedIn Ireland Unlimited Company. LinkedIn and the LinkedIn logo are registered trademarks of LinkedIn.\\n\",\"created_at\":\"2022-03-26T10:07:28.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T19:55:05.000000Z\",\"id\":2,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 16:55:05', '2022-03-27 16:55:05'),
(3, 'created', 3, 'App\\Ticket', 1, '{\"uid\":\"648\",\"title\":{},\"author_email\":\"wessen333@gmail.com\",\"content\":\"this is not what you want but correct\\r\\n\\r\\nOn Sat, Mar 26, 2022 at 6:18 PM wessen <wondwessenh41@gmail.com> wrote:\\r\\n\\r\\n> [image: Laravel Logo] <http:\\/\\/localhost>\\r\\n> Hi,\\r\\n>\\r\\n> New comment on ticket Re: this is form wessen:\\r\\n>\\r\\n> wwwwww\\r\\n> View full ticket <http:\\/\\/127.0.0.1:8000\\/tickets\\/160>\\r\\n>\\r\\n> Thank you\\r\\n>\\r\\n> Laravel Team\\r\\n>\\r\\n> If you\'re having trouble clicking the \\\"View full ticket\\\" button, copy and\\r\\n> paste the URL below into your web browser:\\r\\n> http:\\/\\/127.0.0.1:8000\\/tickets\\/160\\r\\n>\\r\\n> \\u00a9 2022 Laravel. All rights reserved.\\r\\n>\\n\",\"created_at\":\"2022-03-26T18:20:05.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T19:55:08.000000Z\",\"id\":3,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 16:55:08', '2022-03-27 16:55:08'),
(4, 'created', 4, 'App\\Ticket', 1, '{\"uid\":\"649\",\"title\":{},\"author_email\":\"mailer-daemon@googlemail.com\",\"content\":\"** Address not found **\\r\\n\\r\\nYour message wasn\'t delivered to agent3@agent3.com because the address couldn\'t be found, or is unable to receive mail.\\r\\n\\r\\nLearn more here: https:\\/\\/support.google.com\\/mail\\/?p=NoSuchUser\\r\\n\\r\\nThe response was:\\r\\n\\r\\n550 5.1.1 The email account that you tried to reach does not exist. Please try double-checking the recipient\'s email address for typos or unnecessary spaces. Learn more at https:\\/\\/support.google.com\\/mail\\/?p=NoSuchUser q1-20020adff501000000b0020567d40380sor3029618wro.32 - gsmtp\\n\\n\\n\",\"created_at\":\"2022-03-26T08:26:14.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T19:55:11.000000Z\",\"id\":4,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 16:55:11', '2022-03-27 16:55:11'),
(5, 'created', 5, 'App\\Ticket', 1, '{\"uid\":\"650\",\"title\":{},\"author_email\":\"jobalerts-noreply@linkedin.com\",\"content\":\"LinkedIn | Your job alert for ecommerce manager in United States\\r\\n\\r\\n7 new jobs match your preferences.\\r\\n\\r\\n---------------------------------------------------------\\r\\n\\r\\nEcommerce Manager\\r\\n Professional Diversity Network\\r\\nNew York, New York, United States\\r\\n\\r\\nView job: https:\\/\\/www.linkedin.com\\/comm\\/jobs\\/view\\/2992878487?alertAction=markasviewed&savedSearchAuthToken=1%26AQHM5K7MsIX4PAAAAX_K3jV0S-wUnlr6KAtC8N2odVS-cW3UBCs-jcM6W6W2U3g2YAEBcCFug7siHU-WuKZ0-_Q3mheSg-jKH0LduJMV7aS4dF7Rxd3NgrGEs068aHHuKR7tico0la2uxLy_-6YOG9Ssv757WbsplhB-TPByt_SK-mGvr24ah17TowYXBWW6Q1g17rtCi0wy5zaDXXVzf--XwhZ6P_52fGC-zlDLMuI5kcPDK0HoaoGXfL8Xwrb0rvHbmyD7QwYJ3K3ssfedaIsQ3lgAmtnXFMoP3FQTri3JflwLvr4dIrLi%26AQ1g9zTb6T3HvYpFdjzJCR9nrAFQ&savedSearchId=1724366389&refId=bca6b3bf-57b4-46a6-9c2a-fa87914bef39&trackingId=vXYy8ohr7E6PbLsL08XdSA%3D%3D&midToken=AQF9hBFhhpEyow&midSig=1r1SHaCIYBdac1&trk=eml-email_job_alert_digest_01-job_alert-6-member_details_mercado&trkEmail=eml-email_job_alert_digest_01-job_alert-6-member_details_mercado-null-fpeape%7El194j4am%7Eoa-null-jobs%7Eview&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3BT3PYOPgeRAO35%2Bh2m8G2Jg%3D%3D\\r\\n\\r\\n---------------------------------------------------------\\r\\n\\r\\neCommerce Sales Manager\\r\\nSnap Finance\\r\\nSalt Lake City, Utah, United States\\r\\n\\r\\nView job: https:\\/\\/www.linkedin.com\\/comm\\/jobs\\/view\\/2993696805?alertAction=markasviewed&savedSearchAuthToken=1%26AQHM5K7MsIX4PAAAAX_K3jV0S-wUnlr6KAtC8N2odVS-cW3UBCs-jcM6W6W2U3g2YAEBcCFug7siHU-WuKZ0-_Q3mheSg-jKH0LduJMV7aS4dF7Rxd3NgrGEs068aHHuKR7tico0la2uxLy_-6YOG9Ssv757WbsplhB-TPByt_SK-mGvr24ah17TowYXBWW6Q1g17rtCi0wy5zaDXXVzf--XwhZ6P_52fGC-zlDLMuI5kcPDK0HoaoGXfL8Xwrb0rvHbmyD7QwYJ3K3ssfedaIsQ3lgAmtnXFMoP3FQTri3JflwLvr4dIrLi%26AQ1g9zTb6T3HvYpFdjzJCR9nrAFQ&savedSearchId=1724366389&refId=bca6b3bf-57b4-46a6-9c2a-fa87914bef39&trackingId=YdwzhYILp%2FmpKLmXcrhxmw%3D%3D&midToken=AQF9hBFhhpEyow&midSig=1r1SHaCIYBdac1&trk=eml-email_job_alert_digest_01-job_alert-7-member_details_mercado&trkEmail=eml-email_job_alert_digest_01-job_alert-7-member_details_mercado-null-fpeape%7El194j4am%7Eoa-null-jobs%7Eview&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3BT3PYOPgeRAO35%2Bh2m8G2Jg%3D%3D\\r\\n\\r\\n---------------------------------------------------------\\r\\n\\r\\nAssistant eCommerce Content Manager\\r\\nSpectrum Brands, Inc\\r\\nLos Angeles, California, United States\\r\\n\\r\\nView job: https:\\/\\/www.linkedin.com\\/comm\\/jobs\\/view\\/2860067968?alertAction=markasviewed&savedSearchAuthToken=1%26AQHM5K7MsIX4PAAAAX_K3jV0S-wUnlr6KAtC8N2odVS-cW3UBCs-jcM6W6W2U3g2YAEBcCFug7siHU-WuKZ0-_Q3mheSg-jKH0LduJMV7aS4dF7Rxd3NgrGEs068aHHuKR7tico0la2uxLy_-6YOG9Ssv757WbsplhB-TPByt_SK-mGvr24ah17TowYXBWW6Q1g17rtCi0wy5zaDXXVzf--XwhZ6P_52fGC-zlDLMuI5kcPDK0HoaoGXfL8Xwrb0rvHbmyD7QwYJ3K3ssfedaIsQ3lgAmtnXFMoP3FQTri3JflwLvr4dIrLi%26AQ1g9zTb6T3HvYpFdjzJCR9nrAFQ&savedSearchId=1724366389&refId=bca6b3bf-57b4-46a6-9c2a-fa87914bef39&trackingId=yq8qdpiNGVsvaZe2g%2BgSmw%3D%3D&midToken=AQF9hBFhhpEyow&midSig=1r1SHaCIYBdac1&trk=eml-email_job_alert_digest_01-job_alert-8-member_details_mercado&trkEmail=eml-email_job_alert_digest_01-job_alert-8-member_details_mercado-null-fpeape%7El194j4am%7Eoa-null-jobs%7Eview&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3BT3PYOPgeRAO35%2Bh2m8G2Jg%3D%3D\\r\\n\\r\\n---------------------------------------------------------\\r\\n\\r\\nSaleforce Ecommerce Cloud Manager\\r\\nCyberCoders\\r\\nStafford, Texas, United States\\r\\n| Easy Apply\\r\\n\\r\\nView job: https:\\/\\/www.linkedin.com\\/comm\\/jobs\\/view\\/2985252533?alertAction=markasviewed&savedSearchAuthToken=1%26AQHM5K7MsIX4PAAAAX_K3jV0S-wUnlr6KAtC8N2odVS-cW3UBCs-jcM6W6W2U3g2YAEBcCFug7siHU-WuKZ0-_Q3mheSg-jKH0LduJMV7aS4dF7Rxd3NgrGEs068aHHuKR7tico0la2uxLy_-6YOG9Ssv757WbsplhB-TPByt_SK-mGvr24ah17TowYXBWW6Q1g17rtCi0wy5zaDXXVzf--XwhZ6P_52fGC-zlDLMuI5kcPDK0HoaoGXfL8Xwrb0rvHbmyD7QwYJ3K3ssfedaIsQ3lgAmtnXFMoP3FQTri3JflwLvr4dIrLi%26AQ1g9zTb6T3HvYpFdjzJCR9nrAFQ&savedSearchId=1724366389&refId=bca6b3bf-57b4-46a6-9c2a-fa87914bef39&trackingId=TlQHoSZuZE13VTzPfZ0j2w%3D%3D&midToken=AQF9hBFhhpEyow&midSig=1r1SHaCIYBdac1&trk=eml-email_job_alert_digest_01-job_alert-9-member_details_mercado&trkEmail=eml-email_job_alert_digest_01-job_alert-9-member_details_mercado-null-fpeape%7El194j4am%7Eoa-null-jobs%7Eview&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3BT3PYOPgeRAO35%2Bh2m8G2Jg%3D%3D\\r\\n\\r\\n---------------------------------------------------------\\r\\n\\r\\nEcommerce Manager\\r\\nSantoki, LLC\\r\\nAuburn Hills, Michigan, United States\\r\\n\\r\\nView job: https:\\/\\/www.linkedin.com\\/comm\\/jobs\\/view\\/2993251317?alertAction=markasviewed&savedSearchAuthToken=1%26AQHM5K7MsIX4PAAAAX_K3jV0S-wUnlr6KAtC8N2odVS-cW3UBCs-jcM6W6W2U3g2YAEBcCFug7siHU-WuKZ0-_Q3mheSg-jKH0LduJMV7aS4dF7Rxd3NgrGEs068aHHuKR7tico0la2uxLy_-6YOG9Ssv757WbsplhB-TPByt_SK-mGvr24ah17TowYXBWW6Q1g17rtCi0wy5zaDXXVzf--XwhZ6P_52fGC-zlDLMuI5kcPDK0HoaoGXfL8Xwrb0rvHbmyD7QwYJ3K3ssfedaIsQ3lgAmtnXFMoP3FQTri3JflwLvr4dIrLi%26AQ1g9zTb6T3HvYpFdjzJCR9nrAFQ&savedSearchId=1724366389&refId=bca6b3bf-57b4-46a6-9c2a-fa87914bef39&trackingId=uSjTkv2lipx6iV87aNHCpg%3D%3D&midToken=AQF9hBFhhpEyow&midSig=1r1SHaCIYBdac1&trk=eml-email_job_alert_digest_01-job_alert-10-member_details_mercado&trkEmail=eml-email_job_alert_digest_01-job_alert-10-member_details_mercado-null-fpeape%7El194j4am%7Eoa-null-jobs%7Eview&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3BT3PYOPgeRAO35%2Bh2m8G2Jg%3D%3D\\r\\n\\r\\n---------------------------------------------------------\\r\\n\\r\\nAssistant eCommerce Content Manager\\r\\nSpectrum Brands, Inc\\r\\nSan Diego, California, United States\\r\\n\\r\\nView job: https:\\/\\/www.linkedin.com\\/comm\\/jobs\\/view\\/2860070852?alertAction=markasviewed&savedSearchAuthToken=1%26AQHM5K7MsIX4PAAAAX_K3jV0S-wUnlr6KAtC8N2odVS-cW3UBCs-jcM6W6W2U3g2YAEBcCFug7siHU-WuKZ0-_Q3mheSg-jKH0LduJMV7aS4dF7Rxd3NgrGEs068aHHuKR7tico0la2uxLy_-6YOG9Ssv757WbsplhB-TPByt_SK-mGvr24ah17TowYXBWW6Q1g17rtCi0wy5zaDXXVzf--XwhZ6P_52fGC-zlDLMuI5kcPDK0HoaoGXfL8Xwrb0rvHbmyD7QwYJ3K3ssfedaIsQ3lgAmtnXFMoP3FQTri3JflwLvr4dIrLi%26AQ1g9zTb6T3HvYpFdjzJCR9nrAFQ&savedSearchId=1724366389&refId=bca6b3bf-57b4-46a6-9c2a-fa87914bef39&trackingId=FgceZm2yKgEiJPG4m4x9gg%3D%3D&midToken=AQF9hBFhhpEyow&midSig=1r1SHaCIYBdac1&trk=eml-email_job_alert_digest_01-job_alert-11-member_details_mercado&trkEmail=eml-email_job_alert_digest_01-job_alert-11-member_details_mercado-null-fpeape%7El194j4am%7Eoa-null-jobs%7Eview&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3BT3PYOPgeRAO35%2Bh2m8G2Jg%3D%3D\\r\\n\\r\\n---------------------------------------------------------\\r\\n\\r\\n\\r\\n---------------------------------------------------------\\r\\nSee jobs where you\'re a top applicant\\r\\n\\r\\nTry Premium for free: https:\\/\\/www.linkedin.com\\/comm\\/premium\\/products\\/?family=jss&midToken=AQF9hBFhhpEyow&midSig=1r1SHaCIYBdac1&trk=eml-email_job_alert_digest_01-job_alert-16-premium_upsell_top_applicant_mercado&trkEmail=eml-email_job_alert_digest_01-job_alert-16-premium_upsell_top_applicant_mercado-null-fpeape%7El194j4am%7Eoa-null-neptune%2Fpremium%2Eproducts&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3BT3PYOPgeRAO35%2Bh2m8G2Jg%3D%3D\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n.....................................\\r\\n\\r\\nManage your job alerts: https:\\/\\/www.linkedin.com\\/comm\\/jobs\\/alerts?midToken=AQF9hBFhhpEyow&amp;midSig=1r1SHaCIYBdac1&amp;trk=eml-email_job_alert_digest_01-footer-14-manage_alert&amp;trkEmail=eml-email_job_alert_digest_01-footer-14-manage_alert-null-fpeape%7El194j4am%7Eoa-null-job%7Ealert%7Emanager&amp;lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3BT3PYOPgeRAO35%2Bh2m8G2Jg%3D%3D\\r\\n\\r\\nUnsubscribe: https:\\/\\/www.linkedin.com\\/e\\/v2?e=fpeape-l194j4am-oa&amp;lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3BT3PYOPgeRAO35%2Bh2m8G2Jg%3D%3D&amp;a=jobs-jserp-search-mirror&amp;midToken=AQF9hBFhhpEyow&amp;midSig=1r1SHaCIYBdac1&amp;ek=email_job_alert_digest_01&amp;li=15&amp;m=footer&amp;ts=delete_alert&amp;alertAction=delete&amp;savedSearchId=1724366389\\r\\n\\r\\nHelp: https:\\/\\/www.linkedin.com\\/e\\/v2?e=fpeape-l194j4am-oa&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3BT3PYOPgeRAO35%2Bh2m8G2Jg%3D%3D&a=customerServiceUrl&midToken=AQF9hBFhhpEyow&midSig=1r1SHaCIYBdac1&ek=email_job_alert_digest_01&li=40&m=footer&ts=help&articleId=67\\r\\n\\r\\n\\r\\nYou are receiving LinkedIn notification emails.\\r\\n\\r\\nThis email was intended for Wondwessen Haile (Virtual Assistant at ISREAL).\\r\\nLearn why we included this: https:\\/\\/www.linkedin.com\\/e\\/v2?e=fpeape-l194j4am-oa&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3BT3PYOPgeRAO35%2Bh2m8G2Jg%3D%3D&a=customerServiceUrl&midToken=AQF9hBFhhpEyow&midSig=1r1SHaCIYBdac1&ek=email_job_alert_digest_01&articleId=4788\\r\\n\\r\\n\\u00a9 2022 LinkedIn Ireland Unlimited Company, Wilton Plaza, Wilton Place, Dublin 2. LinkedIn is a registered business name of LinkedIn Ireland Unlimited Company. LinkedIn and the LinkedIn logo are registered trademarks of LinkedIn.\\n\",\"created_at\":\"2022-03-27T10:13:54.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T19:55:15.000000Z\",\"id\":5,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 16:55:15', '2022-03-27 16:55:15'),
(6, 'created', 6, 'App\\Ticket', 1, '{\"uid\":\"651\",\"title\":{},\"author_email\":\"jobalerts-noreply@linkedin.com\",\"content\":\"LinkedIn | Your job alert for virtual assistant in United States\\r\\n\\r\\n1 new job matches your preferences.\\r\\n\\r\\n---------------------------------------------------------\\r\\n\\r\\nVirtual Assistant\\r\\nCardinal Health\\r\\nUnited States\\r\\n| Easy Apply\\r\\n\\r\\nView job: https:\\/\\/www.linkedin.com\\/comm\\/jobs\\/view\\/2915808558?alertAction=markasviewed&savedSearchAuthToken=1%26AQH8BnW-bheqzgAAAX_K3jUhH_MYpQjujVZC1DNj9VPuNzqIialMOztAugyAy6achLC_at_-hZWjvXCg4vv4zPFdHg20yYylmzIdf7cVJpy1VQPtxSKNbuvLxyrsBo-OU_pHaV5laTXyrnt3pzJ5474bAnISsUsZMB9wv8G1XixzgIaBeZmPpmcsH2Pw_Kw5PfbItpzTBvroX8cz1dRIzpKHY6Jj4pks_NybVNbHgrSMFDT9XmR-PmRku3Un_YRnZ-86ZW0_C3dF2TdBpksHVbdzc4wJGA87VVun-KwojocLKzNkFYUGx1yT%26Acu_-Jq4wECuYFKaVSAi7JZ8W3HY&savedSearchId=1724366381&refId=941e163d-8609-4afc-b238-a5e9028cccdc&trackingId=lHP9v9siQ444jjfxZkeNWw%3D%3D&midToken=AQF9hBFhhpEyow&midSig=1r1SHaCIYBdac1&trk=eml-email_job_alert_digest_01-job_alert-6-member_details_mercado&trkEmail=eml-email_job_alert_digest_01-job_alert-6-member_details_mercado-null-fpeape%7El194j4an%7Esi-null-jobs%7Eview&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3BzxYsZHeoSeihe7shncreyg%3D%3D\\r\\n\\r\\n---------------------------------------------------------\\r\\n\\r\\n\\r\\n---------------------------------------------------------\\r\\nSee jobs where you\'re a top applicant\\r\\n\\r\\nTry Premium for free: https:\\/\\/www.linkedin.com\\/comm\\/premium\\/products\\/?family=jss&midToken=AQF9hBFhhpEyow&midSig=1r1SHaCIYBdac1&trk=eml-email_job_alert_digest_01-job_alert-10-premium_upsell_top_applicant_mercado&trkEmail=eml-email_job_alert_digest_01-job_alert-10-premium_upsell_top_applicant_mercado-null-fpeape%7El194j4an%7Esi-null-neptune%2Fpremium%2Eproducts&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3BzxYsZHeoSeihe7shncreyg%3D%3D\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n.....................................\\r\\n\\r\\nManage your job alerts: https:\\/\\/www.linkedin.com\\/comm\\/jobs\\/alerts?midToken=AQF9hBFhhpEyow&amp;midSig=1r1SHaCIYBdac1&amp;trk=eml-email_job_alert_digest_01-footer-8-manage_alert&amp;trkEmail=eml-email_job_alert_digest_01-footer-8-manage_alert-null-fpeape%7El194j4an%7Esi-null-job%7Ealert%7Emanager&amp;lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3BzxYsZHeoSeihe7shncreyg%3D%3D\\r\\n\\r\\nUnsubscribe: https:\\/\\/www.linkedin.com\\/e\\/v2?e=fpeape-l194j4an-si&amp;lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3BzxYsZHeoSeihe7shncreyg%3D%3D&amp;a=jobs-jserp-search-mirror&amp;midToken=AQF9hBFhhpEyow&amp;midSig=1r1SHaCIYBdac1&amp;ek=email_job_alert_digest_01&amp;li=9&amp;m=footer&amp;ts=delete_alert&amp;alertAction=delete&amp;savedSearchId=1724366381\\r\\n\\r\\nHelp: https:\\/\\/www.linkedin.com\\/e\\/v2?e=fpeape-l194j4an-si&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3BzxYsZHeoSeihe7shncreyg%3D%3D&a=customerServiceUrl&midToken=AQF9hBFhhpEyow&midSig=1r1SHaCIYBdac1&ek=email_job_alert_digest_01&li=34&m=footer&ts=help&articleId=67\\r\\n\\r\\n\\r\\nYou are receiving LinkedIn notification emails.\\r\\n\\r\\nThis email was intended for Wondwessen Haile (Virtual Assistant at ISREAL).\\r\\nLearn why we included this: https:\\/\\/www.linkedin.com\\/e\\/v2?e=fpeape-l194j4an-si&lipi=urn%3Ali%3Apage%3Aemail_email_job_alert_digest_01%3BzxYsZHeoSeihe7shncreyg%3D%3D&a=customerServiceUrl&midToken=AQF9hBFhhpEyow&midSig=1r1SHaCIYBdac1&ek=email_job_alert_digest_01&articleId=4788\\r\\n\\r\\n\\u00a9 2022 LinkedIn Ireland Unlimited Company, Wilton Plaza, Wilton Place, Dublin 2. LinkedIn is a registered business name of LinkedIn Ireland Unlimited Company. LinkedIn and the LinkedIn logo are registered trademarks of LinkedIn.\\n\",\"created_at\":\"2022-03-27T10:13:54.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T19:55:18.000000Z\",\"id\":6,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 16:55:18', '2022-03-27 16:55:18'),
(7, 'created', 7, 'App\\Ticket', 1, '{\"uid\":\"652\",\"title\":{},\"author_email\":\"wessen333@gmail.com\",\"content\":\"this is new ticket regarding with the conversation problem in my site this\\r\\nis new ticket regarding with the conversation problem in my site this is\\r\\nnew ticket regarding with the conversation problem in my site this is new\\r\\nticket regarding with the conversation problem in my site this is new\\r\\nticket regarding with the conversation problem in my site this is new\\r\\nticket regarding with the conversation problem in my site this is new\\r\\nticket regarding with the conversation problem in my site this is new\\r\\nticket regarding with the conversation problem in my site\\n\",\"created_at\":\"2022-03-27T17:27:45.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T19:55:22.000000Z\",\"id\":7,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 16:55:22', '2022-03-27 16:55:22'),
(8, 'created', 8, 'App\\Ticket', 1, '{\"uid\":\"653\",\"title\":{},\"author_email\":\"mailer-daemon@googlemail.com\",\"content\":\"** Delivery incomplete **\\r\\n\\r\\nThere was a temporary problem delivering your message to admin@admin.com. Gmail will retry for 47 more hours. You\'ll be notified if the delivery fails permanently.\\r\\n\\r\\nLearn more here: https:\\/\\/support.google.com\\/mail\\/answer\\/7720\\r\\n\\r\\nThe response was:\\r\\n\\r\\nThe recipient server did not accept our requests to connect. Learn more at https:\\/\\/support.google.com\\/mail\\/answer\\/7720 \\r\\n[localhost.admin.com. 127.0.0.1: timed out]\\n\\n\\n\",\"created_at\":\"2022-03-27T09:18:14.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T19:55:25.000000Z\",\"id\":8,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 16:55:25', '2022-03-27 16:55:25'),
(9, 'created', 9, 'App\\Ticket', 1, '{\"uid\":\"654\",\"title\":{},\"author_email\":\"mailer-daemon@googlemail.com\",\"content\":\"** Delivery incomplete **\\r\\n\\r\\nThere was a temporary problem delivering your message to admin@admin.com. Gmail will retry for 46 more hours. You\'ll be notified if the delivery fails permanently.\\r\\n\\r\\nLearn more here: https:\\/\\/support.google.com\\/mail\\/answer\\/7720\\r\\n\\r\\nThe response was:\\r\\n\\r\\nThe recipient server did not accept our requests to connect. Learn more at https:\\/\\/support.google.com\\/mail\\/answer\\/7720 \\r\\n[localhost.admin.com. 127.0.0.1: timed out]\\n\\n\\n\",\"created_at\":\"2022-03-27T09:25:36.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T19:55:29.000000Z\",\"id\":9,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 16:55:29', '2022-03-27 16:55:29'),
(10, 'created', 10, 'App\\Ticket', 1, '{\"uid\":\"655\",\"title\":{},\"author_email\":\"mailer-daemon@googlemail.com\",\"content\":\"** Delivery incomplete **\\r\\n\\r\\nThere was a temporary problem delivering your message to agent2@agent2.com. Gmail will retry for 46 more hours. You\'ll be notified if the delivery fails permanently.\\r\\n\\r\\n\\r\\n\\r\\nThe response was:\\r\\n\\r\\nDNS Error: DNS type \'mx\' lookup of agent2.com responded with code NOERROR\\r\\nDNS type \'aaaa\' lookup of localhost. responded with code NXDOMAIN\\r\\nDNS type \'a\' lookup of localhost. responded with code NXDOMAIN\\n\\n\\n\",\"created_at\":\"2022-03-27T09:28:20.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T19:55:32.000000Z\",\"id\":10,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 16:55:32', '2022-03-27 16:55:32'),
(11, 'created', 11, 'App\\Ticket', 1, '{\"uid\":\"656\",\"title\":{},\"author_email\":\"mailer-daemon@googlemail.com\",\"content\":\"** Delivery incomplete **\\r\\n\\r\\nThere was a temporary problem delivering your message to agent2@agent2.com. Gmail will retry for 46 more hours. You\'ll be notified if the delivery fails permanently.\\r\\n\\r\\n\\r\\n\\r\\nThe response was:\\r\\n\\r\\nDNS Error: DNS type \'mx\' lookup of agent2.com responded with code NOERROR\\r\\nDNS type \'aaaa\' lookup of localhost. responded with code NXDOMAIN\\r\\nDNS type \'a\' lookup of localhost. responded with code NXDOMAIN\\n\\n\\n\",\"created_at\":\"2022-03-27T09:34:29.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T19:55:35.000000Z\",\"id\":11,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 16:55:35', '2022-03-27 16:55:35'),
(12, 'created', 12, 'App\\Ticket', 1, '{\"uid\":\"648\",\"title\":{},\"author_email\":\"wessen333@gmail.com\",\"content\":\"this is not what you want but correct\\r\\n\\r\\nOn Sat, Mar 26, 2022 at 6:18 PM wessen <wondwessenh41@gmail.com> wrote:\\r\\n\\r\\n> [image: Laravel Logo] <http:\\/\\/localhost>\\r\\n> Hi,\\r\\n>\\r\\n> New comment on ticket Re: this is form wessen:\\r\\n>\\r\\n> wwwwww\\r\\n> View full ticket <http:\\/\\/127.0.0.1:8000\\/tickets\\/160>\\r\\n>\\r\\n> Thank you\\r\\n>\\r\\n> Laravel Team\\r\\n>\\r\\n> If you\'re having trouble clicking the \\\"View full ticket\\\" button, copy and\\r\\n> paste the URL below into your web browser:\\r\\n> http:\\/\\/127.0.0.1:8000\\/tickets\\/160\\r\\n>\\r\\n> \\u00a9 2022 Laravel. All rights reserved.\\r\\n>\\n\",\"created_at\":\"2022-03-26T18:20:05.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T19:59:43.000000Z\",\"id\":12,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 16:59:43', '2022-03-27 16:59:43'),
(13, 'created', 13, 'App\\Ticket', 1, '{\"uid\":\"649\",\"title\":{},\"author_email\":\"mailer-daemon@googlemail.com\",\"content\":\"** Address not found **\\r\\n\\r\\nYour message wasn\'t delivered to agent3@agent3.com because the address couldn\'t be found, or is unable to receive mail.\\r\\n\\r\\nLearn more here: https:\\/\\/support.google.com\\/mail\\/?p=NoSuchUser\\r\\n\\r\\nThe response was:\\r\\n\\r\\n550 5.1.1 The email account that you tried to reach does not exist. Please try double-checking the recipient\'s email address for typos or unnecessary spaces. Learn more at https:\\/\\/support.google.com\\/mail\\/?p=NoSuchUser q1-20020adff501000000b0020567d40380sor3029618wro.32 - gsmtp\\n\\n\\n\",\"created_at\":\"2022-03-26T08:26:14.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T19:59:47.000000Z\",\"id\":13,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 16:59:47', '2022-03-27 16:59:47'),
(14, 'created', 14, 'App\\Ticket', 1, '{\"uid\":\"653\",\"title\":{},\"author_email\":\"mailer-daemon@googlemail.com\",\"content\":\"** Delivery incomplete **\\r\\n\\r\\nThere was a temporary problem delivering your message to admin@admin.com. Gmail will retry for 47 more hours. You\'ll be notified if the delivery fails permanently.\\r\\n\\r\\nLearn more here: https:\\/\\/support.google.com\\/mail\\/answer\\/7720\\r\\n\\r\\nThe response was:\\r\\n\\r\\nThe recipient server did not accept our requests to connect. Learn more at https:\\/\\/support.google.com\\/mail\\/answer\\/7720 \\r\\n[localhost.admin.com. 127.0.0.1: timed out]\\n\\n\\n\",\"created_at\":\"2022-03-27T09:18:14.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T19:59:50.000000Z\",\"id\":14,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 16:59:50', '2022-03-27 16:59:50'),
(15, 'created', 15, 'App\\Ticket', 1, '{\"uid\":\"654\",\"title\":{},\"author_email\":\"mailer-daemon@googlemail.com\",\"content\":\"** Delivery incomplete **\\r\\n\\r\\nThere was a temporary problem delivering your message to admin@admin.com. Gmail will retry for 46 more hours. You\'ll be notified if the delivery fails permanently.\\r\\n\\r\\nLearn more here: https:\\/\\/support.google.com\\/mail\\/answer\\/7720\\r\\n\\r\\nThe response was:\\r\\n\\r\\nThe recipient server did not accept our requests to connect. Learn more at https:\\/\\/support.google.com\\/mail\\/answer\\/7720 \\r\\n[localhost.admin.com. 127.0.0.1: timed out]\\n\\n\\n\",\"created_at\":\"2022-03-27T09:25:36.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T19:59:53.000000Z\",\"id\":15,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 16:59:53', '2022-03-27 16:59:53'),
(16, 'created', 16, 'App\\Ticket', 1, '{\"uid\":\"655\",\"title\":{},\"author_email\":\"mailer-daemon@googlemail.com\",\"content\":\"** Delivery incomplete **\\r\\n\\r\\nThere was a temporary problem delivering your message to agent2@agent2.com. Gmail will retry for 46 more hours. You\'ll be notified if the delivery fails permanently.\\r\\n\\r\\n\\r\\n\\r\\nThe response was:\\r\\n\\r\\nDNS Error: DNS type \'mx\' lookup of agent2.com responded with code NOERROR\\r\\nDNS type \'aaaa\' lookup of localhost. responded with code NXDOMAIN\\r\\nDNS type \'a\' lookup of localhost. responded with code NXDOMAIN\\n\\n\\n\",\"created_at\":\"2022-03-27T09:28:20.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T19:59:57.000000Z\",\"id\":16,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 16:59:57', '2022-03-27 16:59:57'),
(17, 'created', 17, 'App\\Ticket', 1, '{\"uid\":\"656\",\"title\":{},\"author_email\":\"mailer-daemon@googlemail.com\",\"content\":\"** Delivery incomplete **\\r\\n\\r\\nThere was a temporary problem delivering your message to agent2@agent2.com. Gmail will retry for 46 more hours. You\'ll be notified if the delivery fails permanently.\\r\\n\\r\\n\\r\\n\\r\\nThe response was:\\r\\n\\r\\nDNS Error: DNS type \'mx\' lookup of agent2.com responded with code NOERROR\\r\\nDNS type \'aaaa\' lookup of localhost. responded with code NXDOMAIN\\r\\nDNS type \'a\' lookup of localhost. responded with code NXDOMAIN\\n\\n\\n\",\"created_at\":\"2022-03-27T09:34:29.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T20:00:00.000000Z\",\"id\":17,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:00:00', '2022-03-27 17:00:00'),
(18, 'created', 18, 'App\\Ticket', 1, '{\"uid\":\"657\",\"title\":{},\"author_email\":\"mailer-daemon@googlemail.com\",\"content\":\"** Delivery incomplete **\\r\\n\\r\\nThere was a temporary problem delivering your message to agent2@agent2.com. Gmail will retry for 46 more hours. You\'ll be notified if the delivery fails permanently.\\r\\n\\r\\n\\r\\n\\r\\nThe response was:\\r\\n\\r\\nDNS Error: DNS type \'mx\' lookup of agent2.com responded with code NOERROR\\r\\nDNS type \'aaaa\' lookup of localhost. responded with code NXDOMAIN\\r\\nDNS type \'a\' lookup of localhost. responded with code NXDOMAIN\\n\\n\\n\",\"created_at\":\"2022-03-27T09:39:34.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T20:00:03.000000Z\",\"id\":18,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:00:03', '2022-03-27 17:00:03'),
(19, 'created', 19, 'App\\Ticket', 1, '{\"uid\":\"658\",\"title\":{},\"author_email\":\"mailer-daemon@googlemail.com\",\"content\":\"** Delivery incomplete **\\r\\n\\r\\nThere was a temporary problem delivering your message to agent2@agent2.com. Gmail will retry for 46 more hours. You\'ll be notified if the delivery fails permanently.\\r\\n\\r\\n\\r\\n\\r\\nThe response was:\\r\\n\\r\\nDNS Error: DNS type \'mx\' lookup of agent2.com responded with code NOERROR\\r\\nDNS type \'aaaa\' lookup of localhost. responded with code NXDOMAIN\\r\\nDNS type \'a\' lookup of localhost. responded with code NXDOMAIN\\n\\n\\n\",\"created_at\":\"2022-03-27T09:42:23.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T20:00:07.000000Z\",\"id\":19,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:00:07', '2022-03-27 17:00:07'),
(20, 'created', 20, 'App\\Ticket', 1, '{\"uid\":\"659\",\"title\":{},\"author_email\":\"mailer-daemon@googlemail.com\",\"content\":\"** Address not found **\\r\\n\\r\\nYour message wasn\'t delivered to agent3@agent3.com because the address couldn\'t be found, or is unable to receive mail.\\r\\n\\r\\nLearn more here: https:\\/\\/support.google.com\\/mail\\/?p=NoSuchUser\\r\\n\\r\\nThe response was:\\r\\n\\r\\n550 5.1.1 The email account that you tried to reach does not exist. Please try double-checking the recipient\'s email address for typos or unnecessary spaces. Learn more at https:\\/\\/support.google.com\\/mail\\/?p=NoSuchUser m16-20020a05600c3b1000b0038bd8eead57sor2318706wms.7 - gsmtp\\n\\n\\n\",\"created_at\":\"2022-03-27T10:12:50.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T20:00:10.000000Z\",\"id\":20,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:00:10', '2022-03-27 17:00:10'),
(21, 'created', 21, 'App\\Ticket', 1, '{\"uid\":\"660\",\"title\":{},\"author_email\":\"mailer-daemon@googlemail.com\",\"content\":\"** Delivery incomplete **\\r\\n\\r\\nThere was a temporary problem delivering your message to admin@admin.com. Gmail will retry for 46 more hours. You\'ll be notified if the delivery fails permanently.\\r\\n\\r\\nLearn more here: https:\\/\\/support.google.com\\/mail\\/answer\\/7720\\r\\n\\r\\nThe response was:\\r\\n\\r\\nThe recipient server did not accept our requests to connect. Learn more at https:\\/\\/support.google.com\\/mail\\/answer\\/7720 \\r\\n[localhost.admin.com. 127.0.0.1: timed out]\\n\\n\\n\",\"created_at\":\"2022-03-27T10:14:41.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T20:00:13.000000Z\",\"id\":21,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:00:13', '2022-03-27 17:00:13'),
(22, 'created', 22, 'App\\Ticket', 1, '{\"uid\":\"661\",\"title\":{},\"author_email\":\"mailer-daemon@googlemail.com\",\"content\":\"** Delivery incomplete **\\r\\n\\r\\nThere was a temporary problem delivering your message to agent2@agent2.com. Gmail will retry for 45 more hours. You\'ll be notified if the delivery fails permanently.\\r\\n\\r\\n\\r\\n\\r\\nThe response was:\\r\\n\\r\\nDNS Error: DNS type \'mx\' lookup of agent2.com responded with code NOERROR\\r\\nDNS type \'aaaa\' lookup of localhost. responded with code NXDOMAIN\\r\\nDNS type \'a\' lookup of localhost. responded with code NXDOMAIN\\n\\n\\n\",\"created_at\":\"2022-03-27T11:00:16.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T20:00:17.000000Z\",\"id\":22,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:00:17', '2022-03-27 17:00:17');
INSERT INTO `audit_logs` (`id`, `description`, `subject_id`, `subject_type`, `user_id`, `properties`, `host`, `created_at`, `updated_at`) VALUES
(23, 'created', 23, 'App\\Ticket', 1, '{\"uid\":\"662\",\"title\":{},\"author_email\":\"mailer-daemon@googlemail.com\",\"content\":\"** Address not found **\\r\\n\\r\\nYour message wasn\'t delivered to wessen3333@gmail.com because the address couldn\'t be found, or is unable to receive mail.\\r\\n\\r\\nLearn more here: https:\\/\\/support.google.com\\/mail\\/?p=NoSuchUser\\r\\n\\r\\nThe response was:\\r\\n\\r\\n550 5.1.1 The email account that you tried to reach does not exist. Please try double-checking the recipient\'s email address for typos or unnecessary spaces. Learn more at https:\\/\\/support.google.com\\/mail\\/?p=NoSuchUser j13-20020a5d452d000000b00205a1ce518csor4017830wra.39 - gsmtp\\n\\n\\n\",\"created_at\":\"2022-03-27T11:11:13.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T20:00:20.000000Z\",\"id\":23,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:00:20', '2022-03-27 17:00:20'),
(24, 'created', 24, 'App\\Ticket', 1, '{\"uid\":\"663\",\"title\":{},\"author_email\":\"mailer-daemon@googlemail.com\",\"content\":\"** Delivery incomplete **\\r\\n\\r\\nThere was a temporary problem delivering your message to admin@admin.com. Gmail will retry for 45 more hours. You\'ll be notified if the delivery fails permanently.\\r\\n\\r\\nLearn more here: https:\\/\\/support.google.com\\/mail\\/answer\\/7720\\r\\n\\r\\nThe response was:\\r\\n\\r\\nThe recipient server did not accept our requests to connect. Learn more at https:\\/\\/support.google.com\\/mail\\/answer\\/7720 \\r\\n[localhost.admin.com. 127.0.0.1: timed out]\\n\\n\\n\",\"created_at\":\"2022-03-27T11:12:24.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T20:02:50.000000Z\",\"id\":24,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:02:50', '2022-03-27 17:02:50'),
(25, 'created', 25, 'App\\Ticket', 1, '{\"uid\":\"664\",\"title\":{},\"author_email\":\"mailer-daemon@googlemail.com\",\"content\":\"** Address not found **\\r\\n\\r\\nYour message wasn\'t delivered to wessen3333@gmail.com because the address couldn\'t be found, or is unable to receive mail.\\r\\n\\r\\nLearn more here: https:\\/\\/support.google.com\\/mail\\/?p=NoSuchUser\\r\\n\\r\\nThe response was:\\r\\n\\r\\n550 5.1.1 The email account that you tried to reach does not exist. Please try double-checking the recipient\'s email address for typos or unnecessary spaces. Learn more at https:\\/\\/support.google.com\\/mail\\/?p=NoSuchUser h17-20020a5d6891000000b002057ad62fbdsor4252813wru.3 - gsmtp\\n\\n\\n\",\"created_at\":\"2022-03-27T11:17:49.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T20:02:55.000000Z\",\"id\":25,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:02:55', '2022-03-27 17:02:55'),
(26, 'created', 26, 'App\\Ticket', 1, '{\"uid\":\"665\",\"title\":{},\"author_email\":\"wondwessenh41@gmail.com\",\"content\":\"[Laravel](http:\\/\\/localhost)\\r\\n\\r\\n# Hi,\\r\\n\\r\\nYou have been assigned a new ticket: Delivery Status Notification (Failure)\\r\\n\\r\\nView ticket: http:\\/\\/127.0.0.1:8000\\/admin\\/tickets\\/186\\r\\n\\r\\nThank you\\r\\n\\r\\nLaravel Team\\r\\n\\r\\nIf you\'re having trouble clicking the \\\"View ticket\\\" button, copy and paste the URL below\\r\\ninto your web browser: [http:\\/\\/127.0.0.1:8000\\/admin\\/tickets\\/186](http:\\/\\/127.0.0.1:8000\\/admin\\/tickets\\/186)\\r\\n\\r\\n\\u00a9 2022 Laravel. All rights reserved.\\n\",\"created_at\":\"2022-03-27T18:29:12.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T20:02:59.000000Z\",\"id\":26,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:02:59', '2022-03-27 17:02:59'),
(27, 'created', 27, 'App\\Ticket', 1, '{\"uid\":\"666\",\"title\":{},\"author_email\":\"wondwessenh41@gmail.com\",\"content\":\"[Laravel](http:\\/\\/localhost)\\r\\n\\r\\n# Hi,\\r\\n\\r\\nNew comment on ticket Delivery Status Notification (Failure):\\r\\n\\r\\ni got it\\r\\n\\r\\nView full ticket: http:\\/\\/127.0.0.1:8000\\/admin\\/tickets\\/186\\r\\n\\r\\nThank you\\r\\n\\r\\nLaravel Team\\r\\n\\r\\nIf you\'re having trouble clicking the \\\"View full ticket\\\" button, copy and paste the URL below\\r\\ninto your web browser: [http:\\/\\/127.0.0.1:8000\\/admin\\/tickets\\/186](http:\\/\\/127.0.0.1:8000\\/admin\\/tickets\\/186)\\r\\n\\r\\n\\u00a9 2022 Laravel. All rights reserved.\\n\",\"created_at\":\"2022-03-27T18:31:17.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T20:03:02.000000Z\",\"id\":27,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:03:02', '2022-03-27 17:03:02'),
(28, 'created', 28, 'App\\Ticket', 1, '{\"uid\":\"667\",\"title\":{},\"author_email\":\"mailer-daemon@googlemail.com\",\"content\":\"** Delivery incomplete **\\r\\n\\r\\nThere was a temporary problem delivering your message to admin@admin.com. Gmail will retry for 44 more hours. You\'ll be notified if the delivery fails permanently.\\r\\n\\r\\nLearn more here: https:\\/\\/support.google.com\\/mail\\/answer\\/7720\\r\\n\\r\\nThe response was:\\r\\n\\r\\nThe recipient server did not accept our requests to connect. Learn more at https:\\/\\/support.google.com\\/mail\\/answer\\/7720 \\r\\n[localhost.admin.com. 127.0.0.1: timed out]\\n\\n\\n\",\"created_at\":\"2022-03-27T12:02:01.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T20:03:06.000000Z\",\"id\":28,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:03:06', '2022-03-27 17:03:06'),
(29, 'created', 29, 'App\\Ticket', 1, '{\"uid\":\"668\",\"title\":{},\"author_email\":\"wondwessenh41@gmail.com\",\"content\":\"[Laravel](http:\\/\\/localhost)\\r\\n\\r\\n# Hi,\\r\\n\\r\\nYou have been assigned a new ticket: 1 new job for \'virtual assistant\'\\r\\n\\r\\nView ticket: http:\\/\\/127.0.0.1:8000\\/admin\\/tickets\\/220\\r\\n\\r\\nThank you\\r\\n\\r\\nLaravel Team\\r\\n\\r\\nIf you\'re having trouble clicking the \\\"View ticket\\\" button, copy and paste the URL below\\r\\ninto your web browser: [http:\\/\\/127.0.0.1:8000\\/admin\\/tickets\\/220](http:\\/\\/127.0.0.1:8000\\/admin\\/tickets\\/220)\\r\\n\\r\\n\\u00a9 2022 Laravel. All rights reserved.\\n\",\"created_at\":\"2022-03-27T19:18:47.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T20:03:09.000000Z\",\"id\":29,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:03:09', '2022-03-27 17:03:09'),
(30, 'created', 30, 'App\\Ticket', 1, '{\"uid\":\"669\",\"title\":{},\"author_email\":\"wondwessenh41@gmail.com\",\"content\":\"[Laravel](http:\\/\\/localhost)\\r\\n\\r\\n# Hi,\\r\\n\\r\\nNew comment on ticket 1 new job for \'virtual assistant\':\\r\\n\\r\\nthis is very impresive to see without any delay hwo ever styl im confused dut to such ediot agents !!!\\r\\n\\r\\nView full ticket: http:\\/\\/127.0.0.1:8000\\/admin\\/tickets\\/220\\r\\n\\r\\nThank you\\r\\n\\r\\nLaravel Team\\r\\n\\r\\nIf you\'re having trouble clicking the \\\"View full ticket\\\" button, copy and paste the URL below\\r\\ninto your web browser: [http:\\/\\/127.0.0.1:8000\\/admin\\/tickets\\/220](http:\\/\\/127.0.0.1:8000\\/admin\\/tickets\\/220)\\r\\n\\r\\n\\u00a9 2022 Laravel. All rights reserved.\\n\",\"created_at\":\"2022-03-27T19:19:47.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T20:03:13.000000Z\",\"id\":30,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:03:13', '2022-03-27 17:03:13'),
(31, 'deleted', 13, 'App\\Ticket', 1, '{\"id\":13,\"uid\":649,\"title\":\"Delivery Status Notification (Failure)\",\"content\":\"** Address not found **\\r\\n\\r\\nYour message wasn\'t delivered to agent3@agent3.com because the address couldn\'t be found, or is unable to receive mail.\\r\\n\\r\\nLearn more here: https:\\/\\/support.google.com\\/mail\\/?p=NoSuchUser\\r\\n\\r\\nThe response was:\\r\\n\\r\\n550 5.1.1 The email account that you tried to reach does not exist. Please try double-checking the recipient\'s email address for typos or unnecessary spaces. Learn more at https:\\/\\/support.google.com\\/mail\\/?p=NoSuchUser q1-20020adff501000000b0020567d40380sor3029618wro.32 - gsmtp\\n\\n\\n\",\"author_name\":null,\"author_email\":\"mailer-daemon@googlemail.com\",\"created_at\":\"2022-03-26T08:26:14.000000Z\",\"updated_at\":\"2022-03-27T20:07:49.000000Z\",\"deleted_at\":\"2022-03-27T20:07:49.000000Z\",\"status_id\":1,\"priority_id\":1,\"category_id\":1,\"assigned_to_user_id\":null,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:07:49', '2022-03-27 17:07:49'),
(32, 'created', 31, 'App\\Ticket', 1, '{\"uid\":\"670\",\"title\":{},\"author_email\":\"wessen333@gmail.com\",\"content\":\"hello workld\\n\",\"created_at\":\"2022-03-27T23:13:59.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T20:14:22.000000Z\",\"id\":31,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:14:22', '2022-03-27 17:14:22'),
(33, 'updated', 31, 'App\\Ticket', 1, '{\"id\":31,\"uid\":670,\"title\":\"hello\",\"content\":\"hello workld\",\"author_name\":null,\"author_email\":\"wessen333@gmail.com\",\"created_at\":\"2022-03-27T23:13:59.000000Z\",\"updated_at\":\"2022-03-27T20:14:52.000000Z\",\"deleted_at\":null,\"status_id\":\"1\",\"priority_id\":\"1\",\"category_id\":\"1\",\"assigned_to_user_id\":\"3\",\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:14:52', '2022-03-27 17:14:52'),
(34, 'updated', 31, 'App\\Ticket', 1, '{\"id\":31,\"uid\":670,\"title\":\"hello\",\"content\":\"hello workld\",\"author_name\":null,\"author_email\":\"wessen333@gmail.com\",\"created_at\":\"2022-03-27T23:13:59.000000Z\",\"updated_at\":\"2022-03-27T20:17:15.000000Z\",\"deleted_at\":null,\"status_id\":\"1\",\"priority_id\":\"1\",\"category_id\":\"1\",\"assigned_to_user_id\":null,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:17:15', '2022-03-27 17:17:15'),
(35, 'created', 32, 'App\\Ticket', 1, '{\"uid\":\"671\",\"title\":{},\"author_email\":\"mailer-daemon@googlemail.com\",\"content\":\"** Address not found **\\r\\n\\r\\nYour message wasn\'t delivered to wessen3333@gmail.com because the address couldn\'t be found, or is unable to receive mail.\\r\\n\\r\\nLearn more here: https:\\/\\/support.google.com\\/mail\\/?p=NoSuchUser\\r\\n\\r\\nThe response was:\\r\\n\\r\\n550 5.1.1 The email account that you tried to reach does not exist. Please try double-checking the recipient\'s email address for typos or unnecessary spaces. Learn more at https:\\/\\/support.google.com\\/mail\\/?p=NoSuchUser p12-20020a5d458c000000b001f0183e09d8sor4257406wrq.12 - gsmtp\\n\\n\\n\",\"created_at\":\"2022-03-27T13:14:56.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T20:17:29.000000Z\",\"id\":32,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:17:29', '2022-03-27 17:17:29'),
(36, 'updated', 31, 'App\\Ticket', 1, '{\"id\":31,\"uid\":670,\"title\":\"hello\",\"content\":\"hello workld this would be new\",\"author_name\":null,\"author_email\":\"wessen333@gmail.com\",\"created_at\":\"2022-03-27T23:13:59.000000Z\",\"updated_at\":\"2022-03-27T20:28:12.000000Z\",\"deleted_at\":null,\"status_id\":\"1\",\"priority_id\":\"1\",\"category_id\":\"1\",\"assigned_to_user_id\":null,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:28:12', '2022-03-27 17:28:12'),
(37, 'deleted', 32, 'App\\Ticket', 1, '{\"id\":32,\"uid\":671,\"title\":\"Delivery Status Notification (Failure)\",\"content\":\"** Address not found **\\r\\n\\r\\nYour message wasn\'t delivered to wessen3333@gmail.com because the address couldn\'t be found, or is unable to receive mail.\\r\\n\\r\\nLearn more here: https:\\/\\/support.google.com\\/mail\\/?p=NoSuchUser\\r\\n\\r\\nThe response was:\\r\\n\\r\\n550 5.1.1 The email account that you tried to reach does not exist. Please try double-checking the recipient\'s email address for typos or unnecessary spaces. Learn more at https:\\/\\/support.google.com\\/mail\\/?p=NoSuchUser p12-20020a5d458c000000b001f0183e09d8sor4257406wrq.12 - gsmtp\\n\\n\\n\",\"author_name\":null,\"author_email\":\"mailer-daemon@googlemail.com\",\"created_at\":\"2022-03-27T13:14:56.000000Z\",\"updated_at\":\"2022-03-27T20:30:29.000000Z\",\"deleted_at\":\"2022-03-27T20:30:29.000000Z\",\"status_id\":1,\"priority_id\":1,\"category_id\":1,\"assigned_to_user_id\":null,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:30:29', '2022-03-27 17:30:29'),
(38, 'deleted', 31, 'App\\Ticket', 1, '{\"id\":31,\"uid\":670,\"title\":\"hello\",\"content\":\"hello workld this would be new\",\"author_name\":null,\"author_email\":\"wessen333@gmail.com\",\"created_at\":\"2022-03-27T23:13:59.000000Z\",\"updated_at\":\"2022-03-27T20:30:34.000000Z\",\"deleted_at\":\"2022-03-27T20:30:34.000000Z\",\"status_id\":1,\"priority_id\":1,\"category_id\":1,\"assigned_to_user_id\":null,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:30:34', '2022-03-27 17:30:34'),
(39, 'created', 33, 'App\\Ticket', 1, '{\"uid\":\"672\",\"title\":{},\"author_email\":\"wessen333@gmail.com\",\"content\":\"Here are some great sample subject lines for emails that use the fear of\\r\\nmissing out\\u2026 JetBlue: \\u201c*You\'re missing out on points*.\\u201d Digital Marketer:\\r\\n\\u201c[URGENT] You\'ve got ONE DAY to watch this\\u2026\\u201d Digital Marketer: \\u201cYour\\r\\n7-figure plan goes bye-bye at midnight\\u2026\\u201d\\n\",\"created_at\":\"2022-03-27T23:32:02.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T20:32:29.000000Z\",\"id\":33,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:32:29', '2022-03-27 17:32:29'),
(40, 'updated', 33, 'App\\Ticket', 1, '{\"id\":33,\"uid\":672,\"title\":\"Whats a good subject for an email?\",\"content\":\"Here are some great sample subject lines for emails that use the fear of\\r\\nmissing out\\u2026 JetBlue: \\u201c*You\'re missing out on points*.\\u201d Digital Marketer:\\r\\n\\u201c[URGENT] You\'ve got ONE DAY to watch this\\u2026\\u201d Digital Marketer: \\u201cYour\\r\\n7-figure plan goes bye-bye at midnight\\u2026\\u201d\",\"author_name\":\"Wondwessen Haile\",\"author_email\":\"wessen333@gmail.com\",\"created_at\":\"2022-03-27T23:32:02.000000Z\",\"updated_at\":\"2022-03-27T20:33:34.000000Z\",\"deleted_at\":null,\"status_id\":\"1\",\"priority_id\":\"3\",\"category_id\":\"1\",\"assigned_to_user_id\":\"3\",\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:33:35', '2022-03-27 17:33:35'),
(41, 'updated', 33, 'App\\Ticket', 1, '{\"id\":33,\"uid\":672,\"title\":\"Whats a good subject for an email?\",\"content\":\"Here are some great sample subject lines for emails that use the fear of\\r\\ngood to have this change\",\"author_name\":\"Wondwessen Haile\",\"author_email\":\"wessen333@gmail.com\",\"created_at\":\"2022-03-27T23:32:02.000000Z\",\"updated_at\":\"2022-03-27T20:34:32.000000Z\",\"deleted_at\":null,\"status_id\":\"1\",\"priority_id\":\"3\",\"category_id\":\"1\",\"assigned_to_user_id\":\"3\",\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:34:32', '2022-03-27 17:34:32'),
(42, 'created', 34, 'App\\Ticket', 1, '{\"uid\":\"672\",\"title\":{},\"author_email\":\"wessen333@gmail.com\",\"content\":\"Here are some great sample subject lines for emails that use the fear of\\r\\nmissing out\\u2026 JetBlue: \\u201c*You\'re missing out on points*.\\u201d Digital Marketer:\\r\\n\\u201c[URGENT] You\'ve got ONE DAY to watch this\\u2026\\u201d Digital Marketer: \\u201cYour\\r\\n7-figure plan goes bye-bye at midnight\\u2026\\u201d\\n\",\"created_at\":\"2022-03-27T23:32:02.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T20:40:12.000000Z\",\"id\":34,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:40:12', '2022-03-27 17:40:12'),
(43, 'updated', 34, 'App\\Ticket', 1, '{\"id\":34,\"uid\":672,\"title\":\"Whats a good subject for an email?\",\"content\":\"Here are some great sample subject lines for emails that use the fear of\\r\\nmissing out\\u2026 JetBlue: \\u201c*You\'re missing out on points*.\\u201d Digital Marketer:\\r\\n\\u201c[URGENT] You\'ve got ONE DAY to watch this\\u2026\\u201d Digital Marketer: \\u201cYour\\r\\n7-figure plan goes bye-bye at midnight\\u2026\\u201d\",\"author_name\":null,\"author_email\":\"wessen333@gmail.com\",\"created_at\":\"2022-03-27T23:32:02.000000Z\",\"updated_at\":\"2022-03-27T20:43:33.000000Z\",\"deleted_at\":null,\"status_id\":\"1\",\"priority_id\":\"1\",\"category_id\":\"1\",\"assigned_to_user_id\":\"3\",\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:43:33', '2022-03-27 17:43:33'),
(44, 'created', 35, 'App\\Ticket', 1, '{\"uid\":\"672\",\"title\":{},\"author_email\":\"wessen333@gmail.com\",\"content\":\"Here are some great sample subject lines for emails that use the fear of\\r\\nmissing out\\u2026 JetBlue: \\u201c*You\'re missing out on points*.\\u201d Digital Marketer:\\r\\n\\u201c[URGENT] You\'ve got ONE DAY to watch this\\u2026\\u201d Digital Marketer: \\u201cYour\\r\\n7-figure plan goes bye-bye at midnight\\u2026\\u201d\\n\",\"created_at\":\"2022-03-27T23:32:02.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T20:45:30.000000Z\",\"id\":35,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:45:30', '2022-03-27 17:45:30'),
(45, 'created', 36, 'App\\Ticket', 1, '{\"uid\":\"674\",\"title\":{},\"author_email\":\"mailer-daemon@googlemail.com\",\"content\":\"** Address not found **\\r\\n\\r\\nYour message wasn\'t delivered to wessen3333@gmail.com because the address couldn\'t be found, or is unable to receive mail.\\r\\n\\r\\nLearn more here: https:\\/\\/support.google.com\\/mail\\/?p=NoSuchUser\\r\\n\\r\\nThe response was:\\r\\n\\r\\n550 5.1.1 The email account that you tried to reach does not exist. Please try double-checking the recipient\'s email address for typos or unnecessary spaces. Learn more at https:\\/\\/support.google.com\\/mail\\/?p=NoSuchUser h16-20020a05600c351000b00389c9b04447sor3223086wmq.16 - gsmtp\\n\\n\\n\",\"created_at\":\"2022-03-27T13:43:37.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-27T20:45:34.000000Z\",\"id\":36,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-27 17:45:34', '2022-03-27 17:45:34'),
(46, 'deleted', 36, 'App\\Ticket', 1, '{\"id\":36,\"uid\":674,\"title\":\"Delivery Status Notification (Failure)\",\"content\":\"** Address not found **\\r\\n\\r\\nYour message wasn\'t delivered to wessen3333@gmail.com because the address couldn\'t be found, or is unable to receive mail.\\r\\n\\r\\nLearn more here: https:\\/\\/support.google.com\\/mail\\/?p=NoSuchUser\\r\\n\\r\\nThe response was:\\r\\n\\r\\n550 5.1.1 The email account that you tried to reach does not exist. Please try double-checking the recipient\'s email address for typos or unnecessary spaces. Learn more at https:\\/\\/support.google.com\\/mail\\/?p=NoSuchUser h16-20020a05600c351000b00389c9b04447sor3223086wmq.16 - gsmtp\\n\\n\\n\",\"author_name\":null,\"author_email\":\"mailer-daemon@googlemail.com\",\"created_at\":\"2022-03-27T13:43:37.000000Z\",\"updated_at\":\"2022-03-28T05:23:23.000000Z\",\"deleted_at\":\"2022-03-28T05:23:23.000000Z\",\"status_id\":1,\"priority_id\":1,\"category_id\":1,\"assigned_to_user_id\":null,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-28 02:23:23', '2022-03-28 02:23:23'),
(47, 'created', 37, 'App\\Ticket', 1, '{\"uid\":\"674\",\"title\":{},\"author_email\":\"mailer-daemon@googlemail.com\",\"content\":\"** Address not found **\\r\\n\\r\\nYour message wasn\'t delivered to wessen3333@gmail.com because the address couldn\'t be found, or is unable to receive mail.\\r\\n\\r\\nLearn more here: https:\\/\\/support.google.com\\/mail\\/?p=NoSuchUser\\r\\n\\r\\nThe response was:\\r\\n\\r\\n550 5.1.1 The email account that you tried to reach does not exist. Please try double-checking the recipient\'s email address for typos or unnecessary spaces. Learn more at https:\\/\\/support.google.com\\/mail\\/?p=NoSuchUser h16-20020a05600c351000b00389c9b04447sor3223086wmq.16 - gsmtp\\n\\n\\n\",\"created_at\":\"2022-03-27T13:43:37.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-28T05:43:17.000000Z\",\"id\":37,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-28 02:43:17', '2022-03-28 02:43:17'),
(48, 'created', 38, 'App\\Ticket', 1, '{\"uid\":\"675\",\"title\":{},\"author_email\":\"wessen333@gmail.com\",\"content\":\"According to Robert Cialdini\\u2019s \\u201cliking\\u201d principle\\r\\n<https:\\/\\/www.influenceatwork.com\\/principles-of-persuasion\\/>, we say yes to\\r\\nrequests made by people we *know* and *like*, more often than those we\\r\\ndon\\u2019t. What\\u2019s more, we like people who are similar to us.\\r\\n\\r\\nCheck out this subject line\\r\\n<https:\\/\\/sleeknote.com\\/blog\\/email-subject-lines> they\\r\\nrecently used:\\r\\n\\r\\nIt\\u2019s no different for brands. We like companies that can relate to us, and\\r\\nHuckberry\\u2019s <https:\\/\\/huckberry.com\\/> gentle humor targets exactly that.\\n\",\"created_at\":\"2022-03-28T08:56:12.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-28T05:56:39.000000Z\",\"id\":38,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-28 02:56:39', '2022-03-28 02:56:39'),
(49, 'created', 39, 'App\\Ticket', 1, '{\"uid\":\"676\",\"title\":{},\"author_email\":\"wessen333@gmail.com\",\"content\":\"<div dir=\\\"ltr\\\"><div><p style=\\\"box-sizing:border-box;margin-top:0px;margin-bottom:1rem;font-size:1.143rem;line-height:29px;color:rgb(23,25,51);font-family:Sailec,sans-serif\\\">According to\\u00a0<a href=\\\"https:\\/\\/www.influenceatwork.com\\/principles-of-persuasion\\/\\\" target=\\\"_blank\\\" rel=\\\"noreferrer noopener\\\" style=\\\"box-sizing:border-box;color:rgb(6,103,86);text-decoration-line:none;background-color:transparent\\\">Robert Cialdini\\u2019s \\u201cliking\\u201d principle<\\/a>, we say yes to requests made by people we\\u00a0<em style=\\\"box-sizing:border-box\\\">know<\\/em>\\u00a0and\\u00a0<em style=\\\"box-sizing:border-box\\\">like<\\/em>, more often than those we don\\u2019t. What\\u2019s more, we like people who are similar to us.<\\/p><p style=\\\"box-sizing:border-box;margin-top:0px;margin-bottom:1rem;font-size:1.143rem;line-height:29px;color:rgb(23,25,51);font-family:Sailec,sans-serif\\\">It\\u2019s no different for brands. We like companies that can relate to us, and\\u00a0<a href=\\\"https:\\/\\/huckberry.com\\/\\\" target=\\\"_blank\\\" rel=\\\"noreferrer noopener\\\" style=\\\"box-sizing:border-box;color:rgb(6,103,86);text-decoration-line:none;background-color:transparent\\\">Huckberry\\u2019s<\\/a>\\u00a0gentle humor targets exactly that.<\\/p><p style=\\\"box-sizing:border-box;margin-top:0px;margin-bottom:1rem;font-size:1.143rem;line-height:29px;color:rgb(23,25,51);font-family:Sailec,sans-serif\\\">Check out this\\u00a0<a href=\\\"https:\\/\\/sleeknote.com\\/blog\\/email-subject-lines\\\" target=\\\"_blank\\\" rel=\\\"noreferrer noopener\\\" style=\\\"box-sizing:border-box;color:rgb(6,103,86);text-decoration-line:none;background-color:transparent\\\">subject line<\\/a>\\u00a0they recently used:<\\/p><\\/div><\\/div>\",\"created_at\":\"2022-03-28T09:05:37.000000Z\",\"category_id\":1,\"status_id\":1,\"priority_id\":1,\"updated_at\":\"2022-03-28T06:06:19.000000Z\",\"id\":39,\"attachments\":[],\"media\":[]}', '127.0.0.1', '2022-03-28 03:06:19', '2022-03-28 03:06:19');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `color`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Uncategorized', '#97a1ab', '2022-03-27 16:53:43', '2022-03-27 16:53:43', NULL),
(2, 'Billing/Payments', '#a0c980', '2022-03-27 16:53:43', '2022-03-27 16:53:43', NULL),
(3, 'Technical question', '#f0af94', '2022-03-27 16:53:43', '2022-03-27 16:53:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `ticket_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `author_name`, `author_email`, `comment_text`, `created_at`, `updated_at`, `deleted_at`, `ticket_id`, `user_id`) VALUES
(4, 'Admin', 'wessen333@gmail.com', 'good website and we say yes to requests made by people we know too', '2022-03-28 03:10:53', '2022-03-28 03:10:53', NULL, 39, 1),
(5, NULL, 'wessen333@gmail.com', 'thank you for your response, we will replay you back soon!!!', '2022-03-28 03:12:29', '2022-03-28 03:12:29', NULL, 39, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(3, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(4, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(5, '2016_06_01_000004_create_oauth_clients_table', 1),
(6, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(7, '2019_11_09_000001_create_permissions_table', 1),
(8, '2019_11_09_000002_create_roles_table', 1),
(9, '2019_11_09_000003_create_users_table', 1),
(10, '2019_11_09_000004_create_statuses_table', 1),
(11, '2019_11_09_000005_create_priorities_table', 1),
(12, '2019_11_09_000006_create_categories_table', 1),
(13, '2019_11_09_000007_create_tickets_table', 1),
(14, '2019_11_09_000008_create_comments_table', 1),
(15, '2019_11_09_000009_create_permission_role_pivot_table', 1),
(16, '2019_11_09_000010_create_role_user_pivot_table', 1),
(17, '2019_11_09_000011_add_relationship_fields_to_tickets_table', 1),
(18, '2019_11_09_000012_add_relationship_fields_to_comments_table', 1),
(19, '2019_11_09_000013_create_audit_logs_table', 1),
(20, '2019_11_10_000001_create_media_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'user_management_access', NULL, NULL, NULL),
(2, 'permission_create', NULL, NULL, NULL),
(3, 'permission_edit', NULL, NULL, NULL),
(4, 'permission_show', NULL, NULL, NULL),
(5, 'permission_delete', NULL, NULL, NULL),
(6, 'permission_access', NULL, NULL, NULL),
(7, 'role_create', NULL, NULL, NULL),
(8, 'role_edit', NULL, NULL, NULL),
(9, 'role_show', NULL, NULL, NULL),
(10, 'role_delete', NULL, NULL, NULL),
(11, 'role_access', NULL, NULL, NULL),
(12, 'user_create', NULL, NULL, NULL),
(13, 'user_edit', NULL, NULL, NULL),
(14, 'user_show', NULL, NULL, NULL),
(15, 'user_delete', NULL, NULL, NULL),
(16, 'user_access', NULL, NULL, NULL),
(17, 'status_create', NULL, NULL, NULL),
(18, 'status_edit', NULL, NULL, NULL),
(19, 'status_show', NULL, NULL, NULL),
(20, 'status_delete', NULL, NULL, NULL),
(21, 'status_access', NULL, NULL, NULL),
(22, 'priority_create', NULL, NULL, NULL),
(23, 'priority_edit', NULL, NULL, NULL),
(24, 'priority_show', NULL, NULL, NULL),
(25, 'priority_delete', NULL, NULL, NULL),
(26, 'priority_access', NULL, NULL, NULL),
(27, 'category_create', NULL, NULL, NULL),
(28, 'category_edit', NULL, NULL, NULL),
(29, 'category_show', NULL, NULL, NULL),
(30, 'category_delete', NULL, NULL, NULL),
(31, 'category_access', NULL, NULL, NULL),
(32, 'ticket_create', NULL, NULL, NULL),
(33, 'ticket_edit', NULL, NULL, NULL),
(34, 'ticket_show', NULL, NULL, NULL),
(35, 'ticket_delete', NULL, NULL, NULL),
(36, 'ticket_access', NULL, NULL, NULL),
(37, 'comment_create', NULL, NULL, NULL),
(38, 'comment_edit', NULL, NULL, NULL),
(39, 'comment_show', NULL, NULL, NULL),
(40, 'comment_delete', NULL, NULL, NULL),
(41, 'comment_access', NULL, NULL, NULL),
(42, 'audit_log_show', NULL, NULL, NULL),
(43, 'audit_log_access', NULL, NULL, NULL),
(44, 'dashboard_access', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(2, 33),
(2, 34),
(2, 36);

-- --------------------------------------------------------

--
-- Table structure for table `priorities`
--

CREATE TABLE `priorities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `priorities`
--

INSERT INTO `priorities` (`id`, `name`, `color`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Low', '#23f856', '2022-03-27 16:53:43', '2022-03-27 16:53:43', NULL),
(2, 'Medium', '#56a1de', '2022-03-27 16:53:43', '2022-03-27 16:53:43', NULL),
(3, 'High', '#876e47', '2022-03-27 16:53:43', '2022-03-27 16:53:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', NULL, NULL, NULL),
(2, 'Agent', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `color`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Open', '#f17b70', '2022-03-27 16:53:43', '2022-03-27 16:53:43', NULL),
(2, 'Closed', '#fe6a53', '2022-03-27 16:53:43', '2022-03-27 16:53:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status_id` int(10) UNSIGNED NOT NULL,
  `priority_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `assigned_to_user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `uid`, `title`, `content`, `author_name`, `author_email`, `created_at`, `updated_at`, `deleted_at`, `status_id`, `priority_id`, `category_id`, `assigned_to_user_id`) VALUES
(39, 676, 'Huckberry’s Relatable Humor', '<div dir=\"ltr\"><div><p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:1rem;font-size:1.143rem;line-height:29px;color:rgb(23,25,51);font-family:Sailec,sans-serif\">According to <a href=\"https://www.influenceatwork.com/principles-of-persuasion/\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"box-sizing:border-box;color:rgb(6,103,86);text-decoration-line:none;background-color:transparent\">Robert Cialdini’s “liking” principle</a>, we say yes to requests made by people we <em style=\"box-sizing:border-box\">know</em> and <em style=\"box-sizing:border-box\">like</em>, more often than those we don’t. What’s more, we like people who are similar to us.</p><p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:1rem;font-size:1.143rem;line-height:29px;color:rgb(23,25,51);font-family:Sailec,sans-serif\">It’s no different for brands. We like companies that can relate to us, and <a href=\"https://huckberry.com/\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"box-sizing:border-box;color:rgb(6,103,86);text-decoration-line:none;background-color:transparent\">Huckberry’s</a> gentle humor targets exactly that.</p><p style=\"box-sizing:border-box;margin-top:0px;margin-bottom:1rem;font-size:1.143rem;line-height:29px;color:rgb(23,25,51);font-family:Sailec,sans-serif\">Check out this <a href=\"https://sleeknote.com/blog/email-subject-lines\" target=\"_blank\" rel=\"noreferrer noopener\" style=\"box-sizing:border-box;color:rgb(6,103,86);text-decoration-line:none;background-color:transparent\">subject line</a> they recently used:</p></div></div>', NULL, 'wessen333@gmail.com', '2022-03-28 06:05:37', '2022-03-28 03:06:19', NULL, 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'wessen333@gmail.com', NULL, '$2a$12$HWvovW7LPyykOo.8Ey93dOh5vdIwfhdQVLD7BHW1EQo9S6nSlNywe', NULL, NULL, NULL, NULL),
(2, 'User 1', 'wondwessenh41@gmail.com', NULL, '$2a$12$HWvovW7LPyykOo.8Ey93dOh5vdIwfhdQVLD7BHW1EQo9S6nSlNywe', NULL, NULL, NULL, NULL),
(3, ' user 2', 'wessen3333@gmail.com', NULL, '$2a$12$HWvovW7LPyykOo.8Ey93dOh5vdIwfhdQVLD7BHW1EQo9S6nSlNywe', NULL, NULL, NULL, NULL),
(4, 'user 3', 'wessen33333@gmail.com', NULL, '$2a$12$HWvovW7LPyykOo.8Ey93dOh5vdIwfhdQVLD7BHW1EQo9S6nSlNywe', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_fk_583774` (`ticket_id`),
  ADD KEY `user_fk_583777` (`user_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD KEY `role_id_fk_583549` (`role_id`),
  ADD KEY `permission_id_fk_583549` (`permission_id`);

--
-- Indexes for table `priorities`
--
ALTER TABLE `priorities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD KEY `user_id_fk_583558` (`user_id`),
  ADD KEY `role_id_fk_583558` (`role_id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_fk_583763` (`status_id`),
  ADD KEY `priority_fk_583764` (`priority_id`),
  ADD KEY `category_fk_583765` (`category_id`),
  ADD KEY `assigned_to_user_fk_583768` (`assigned_to_user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `priorities`
--
ALTER TABLE `priorities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `ticket_fk_583774` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`),
  ADD CONSTRAINT `user_fk_583777` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_id_fk_583549` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_id_fk_583549` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_id_fk_583558` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_id_fk_583558` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `assigned_to_user_fk_583768` FOREIGN KEY (`assigned_to_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `category_fk_583765` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `priority_fk_583764` FOREIGN KEY (`priority_id`) REFERENCES `priorities` (`id`),
  ADD CONSTRAINT `status_fk_583763` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
