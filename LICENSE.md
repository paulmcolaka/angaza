# ANGAZA PRESENT
## End User License Agreement (EULA)

**Version 1.0 — Effective Date: 2025**

---

> This End User License Agreement ("Agreement") is a legally binding contract between you ("Licensee," "you," or "your") and **Angaza Technologies Ltd.**, a company registered in the Republic of Kenya ("Angaza," "we," "us," or "our"). By installing, downloading, activating, or using Angaza Present ("the Software"), you confirm that you have read, understood, and agree to be bound by the terms of this Agreement. If you do not agree to these terms, do not install or use the Software.

---

## 1. Definitions

**1.1 "Software"** means the Angaza Present desktop application (Windows and macOS), all associated files, documentation, updates, upgrades, and patches provided by Angaza Technologies Ltd.

**1.2 "Subscription"** means a recurring payment arrangement that grants the Licensee a time-limited right to use the Software at a specified tier level (Starter, Standard, or Mega), as defined in the Pricing Schedule at `https://angaza.app/pricing`.

**1.3 "License"** means the limited, non-exclusive, non-transferable, revocable right to use the Software granted under this Agreement.

**1.4 "Activation"** means the process by which the Software verifies a valid Subscription and binds the License to a specific hardware device via a Cryptographic Lease.

**1.5 "Cryptographic Lease"** means a digitally signed JSON Web Token (JWT) issued by Angaza's servers to a specific device, encoding the Subscription tier, expiry date, and hardware binding. The Lease enables the Software to operate offline within defined parameters.

**1.6 "Device"** means a single physical computer (Windows PC or Mac) on which the Software is installed and Activated.

**1.7 "Machine ID"** means the unique hardware fingerprint derived from the Device's hardware identifiers and used to bind the Cryptographic Lease to a specific Device.

**1.8 "Licensee Content"** means any songs, Scripture references, media files, presentations, and other content created or imported by the Licensee within the Software.

**1.9 "Marketplace Theme"** means a `.agt` (Angaza Theme) file published by a Creator through the Angaza Creator Marketplace.

**1.10 "Creator"** means a user who has registered as a content creator on the Angaza platform and has been approved to publish Marketplace Themes.

**1.11 "Subscription Period"** means the monthly or annual period for which a Subscription fee has been paid.

---

## 2. License Grant

**2.1 Grant of License.** Subject to your compliance with this Agreement and payment of the applicable Subscription fees, Angaza Technologies Ltd. grants you a limited, non-exclusive, non-transferable, revocable license to:

(a) Install and use the Software on the number of Devices permitted by your Subscription tier (one Device for Starter, two Devices for Standard, unlimited Devices for Mega);

(b) Use the Software solely for your internal church presentation purposes during active church services, rehearsals, and related ministry activities;

(c) Access and use the features of the Software that correspond to your Subscription tier.

**2.2 Restrictions on License.** The License does not permit you to:

(a) Copy, modify, merge, publish, distribute, sublicense, or sell the Software or any portion of it;

(b) Reverse engineer, decompile, disassemble, or attempt to derive the source code of the Software, except to the extent expressly permitted by applicable law notwithstanding this restriction;

(c) Remove, alter, or obscure any proprietary notices, labels, or marks on the Software;

(d) Use the Software to provide services to third parties on a commercial time-sharing, service bureau, or application service provider basis;

(e) Install the Software on more Devices than permitted by your Subscription tier;

(f) Share, transfer, lend, rent, lease, or otherwise make the Software available to any third party;

(g) Circumvent, disable, bypass, or interfere with the Cryptographic Lease system, hardware binding, clock guard, or any other licensing enforcement mechanism of the Software;

(h) Use the Software in any way that violates applicable laws or regulations in Kenya or in your jurisdiction;

(i) Use the Software to display content that is defamatory, obscene, illegal, or promotes violence or discrimination.

**2.3 Evaluation Period.** New Devices are granted a three (3) day evaluation period ("Trial") during which the Software operates at the Standard tier feature level without payment. The Trial is limited to one Trial per Device (as identified by the Machine ID). After the Trial expires, a Subscription must be purchased to continue using the Software.

---

## 3. Subscription and Payment

**3.1 Subscription Requirement.** The Software requires an active, paid Subscription to operate beyond the Trial period and beyond the Grace Period described in Section 4.

**3.2 Subscription Tiers.** Subscriptions are available at the following tiers, with features and pricing as published at `https://angaza.app/pricing`. Current pricing as of the effective date of this Agreement:

| Tier | Monthly Price | Annual Price |
|---|---|---|
| Starter | KES 1,500 | KES 15,000 |
| Standard | KES 3,000 | KES 30,000 |
| Mega | KES 5,500 | KES 55,000 |

Angaza reserves the right to modify pricing with thirty (30) days' written notice. Price changes will not affect your current paid Subscription Period.

**3.3 Payment Methods.** Subscriptions may be paid via M-Pesa (Lipa Na M-Pesa) or such other payment methods as Angaza may offer from time to time.

**3.4 Automatic Renewal.** Monthly Subscriptions do not automatically renew. You must initiate renewal before or during the Grace Period to avoid service interruption. Annual Subscriptions renew automatically unless cancelled at least seven (7) days before the renewal date.

**3.5 Refunds.** All Subscription fees are non-refundable once the Subscription has been Activated on a Device, except where required by applicable Kenyan consumer protection law. Marketplace Theme purchases are non-refundable once the download link has been generated.

**3.6 Taxes.** All fees are stated exclusive of applicable taxes. You are responsible for any Value Added Tax (VAT), withholding tax, or other taxes applicable in your jurisdiction.

---

## 4. Cryptographic Lease System and Offline Enforcement

**4.1 Lease Issuance.** Upon successful payment and Activation, Angaza's servers issue a Cryptographic Lease to your Device. The Lease is signed with an RS256 asymmetric key and encodes your Subscription tier, expiry date, and Machine ID. The Lease enables the Software to function offline for a defined period.

**4.2 Lease Duration.** A Cryptographic Lease is valid for thirty-five (35) days from the date of issuance (thirty days of Subscription plus five days of Grace Period). The Software verifies the Lease locally on every launch without requiring an internet connection during this period.

**4.3 Grace Period.** If your Subscription expires but the Cryptographic Lease is within the five (5) day Grace Period window:

(a) The Software will continue to function with full presentation capabilities;

(b) A warning notification will be displayed on the Control Screen (operator display) only;

(c) No warning, notification, or overlay will be displayed on the Projector Screen (output display) visible to the congregation.

**4.4 Lockout.** If the Cryptographic Lease expires beyond the Grace Period:

(a) The Software will enter "Read Only" mode;

(b) All projection output will be disabled;

(c) The Software may be used to browse content only;

(d) Projection output will be restored immediately upon Subscription renewal and Lease issuance.

**4.5 Clock Guard.** The Software maintains a record of the last known system time in encrypted local storage. If the Device's system clock is detected to be set earlier than the last known time by more than sixty (60) seconds, the Software will enter a locked state until:

(a) The system clock is restored to the correct time; and

(b) An internet connection is established to verify the correct time with Angaza's servers.

This mechanism protects against subscription fraud via system clock manipulation. Angaza is not responsible for any service interruption resulting from legitimate clock adjustments made by IT administrators.

**4.6 Hardware Binding.** The Cryptographic Lease is bound to a Machine ID derived from the Device's hardware. The Software will not function on a different Device using the same Lease. Installing the Software on a new Device requires a new Activation, subject to the device limits of your Subscription tier.

**4.7 Device Management.** You may manage your activated Devices through your account at `https://angaza.app/dashboard`. Deactivating a Device frees a Device slot for use on another Device.

---

## 5. AI Sermon Assist

**5.1 Local Processing.** The AI Sermon Assist feature uses whisper.cpp, an open-source speech recognition library, running entirely on the Licensee's Device. Audio captured by the microphone is processed in the Device's memory only and is not transmitted to Angaza's servers or any third-party service.

**5.2 Model Download.** The Whisper speech recognition model file (approximately 75 MB for the Tiny model, approximately 142 MB for the Base model) is downloaded from Angaza's content delivery network on first activation of the AI Assist feature. After download, the model is stored locally and the AI Assist feature operates without an internet connection.

**5.3 Microphone Permission.** The AI Assist feature requires microphone access. You are responsible for obtaining the consent of all persons whose speech may be captured, to the extent required by applicable privacy laws. Angaza is not responsible for any legal liability arising from your use of the microphone capture feature.

**5.4 Accuracy.** The AI Sermon Assist is provided as a productivity aid only. Verse detection results are suggestions presented to the operator for review and approval before display. Angaza does not warrant the accuracy of transcription or verse detection. The Licensee is solely responsible for verifying that any verse displayed to the congregation is correct.

**5.5 Tier Restriction.** AI Sermon Assist is available on Standard and Mega tiers only. Starter tier subscribers may upgrade to access this feature.

---

## 6. Creator Marketplace

**6.1 Marketplace Access.** The Software includes access to the Angaza Creator Marketplace, where Creators publish Marketplace Themes for use within the Software. Access to the Marketplace is subject to your Subscription tier.

**6.2 Theme License.** Upon purchase of a Marketplace Theme, you are granted a non-exclusive, non-transferable license to install and use that Theme within the Angaza Present Software on Devices covered by your Subscription. You may not:

(a) Redistribute, resell, sublicense, or share the Theme file with any person;

(b) Reverse engineer, extract, or reuse the Theme's assets outside of Angaza Present;

(c) Represent the Theme as your own creation.

**6.3 Creator Terms.** Creators publishing Themes on the Marketplace are subject to a separate Creator Agreement. By publishing a Theme, a Creator represents and warrants that:

(a) They own all intellectual property rights in the Theme's assets, or have obtained all necessary licences;

(b) The Theme does not infringe any third-party intellectual property rights;

(c) The Theme does not contain malicious code, viruses, or harmful content;

(d) The Theme complies with Angaza's content standards.

**6.4 Revenue Share.** Angaza retains ten percent (10%) of all Marketplace Theme revenue. The Creator receives ninety percent (90%). Payouts are processed monthly via M-Pesa B2C to the Creator's registered Safaricom number, subject to a minimum payout threshold of KES 500 per month.

**6.5 Content Standards.** All Marketplace Themes are reviewed by Angaza before publication. Angaza reserves the right to reject or remove any Theme that:

(a) Contains content that is offensive, defamatory, obscene, or contrary to Christian values;

(b) Infringes the intellectual property rights of any third party;

(c) Contains malicious code or unauthorised functionality.

**6.6 Angaza's Liability for Marketplace Content.** Angaza acts as a platform facilitating transactions between Creators and Licensees and is not responsible for the content of Marketplace Themes beyond exercising reasonable moderation. Any dispute regarding a Marketplace Theme is primarily between the Licensee and the Creator.

---

## 7. Bible Content

**7.1 Bundled Bible Versions.** The Software includes the King James Version (KJV) and the Swahili Union Version (SUV) of the Bible. These versions are included under applicable public domain licensing.

**7.2 Downloaded Bible Versions.** The Software allows you to download additional Bible versions via the API.Bible service. Your use of downloaded Bible versions is subject to the copyright terms of each individual Bible version. Some versions may be restricted to personal, non-commercial use. You are responsible for ensuring your use of any Bible version complies with its applicable licence terms.

**7.3 No Warranty of Accuracy.** Bible text is provided as sourced from third-party databases. Angaza does not warrant the accuracy, completeness, or doctrinal correctness of any Bible text. Always verify displayed Scripture with authoritative printed Bibles for doctrinal or legal purposes.

---

## 8. Intellectual Property

**8.1 Ownership.** The Software, including all source code, object code, user interface designs, graphics, documentation, and any updates or modifications thereto, is and remains the exclusive property of Angaza Technologies Ltd. All rights not expressly granted in this Agreement are reserved.

**8.2 Licensee Content.** You retain ownership of all Licensee Content. By using the Software, you do not transfer any intellectual property rights to Angaza. You grant Angaza a limited, non-exclusive licence to process your Licensee Content solely to provide the Software's functionality to you.

**8.3 Feedback.** If you provide feedback, suggestions, or ideas about the Software, you grant Angaza a perpetual, irrevocable, royalty-free, worldwide licence to use such feedback for any purpose, including improving the Software.

**8.4 Third-Party Components.** The Software incorporates third-party open-source components, including but not limited to Flutter (BSD 3-Clause), whisper.cpp (MIT), and Prisma (Apache 2.0). Notices and licence terms for these components are included in the `THIRD_PARTY_LICENSES.txt` file distributed with the Software. Your rights with respect to these components are governed by their respective licences.

**8.5 Trademarks.** "Angaza Present," "Angaza," and the Angaza logo are trademarks of Angaza Technologies Ltd. You may not use these marks without prior written consent. "M-Pesa" is a registered trademark of Safaricom PLC.

---

## 9. Privacy and Data

**9.1 Data Collection.** Angaza collects and processes the following data to provide the Software:

(a) **Account data:** email address, name, church name, phone number;

(b) **Subscription data:** tier, payment history, Cryptographic Lease records;

(c) **Device data:** Machine ID hash (a one-way SHA-256 hash — the underlying hardware identifiers are not stored), device type, operating system;

(d) **Usage data:** feature usage events, error reports (no personal content is included in error reports);

(e) **Payment data:** M-Pesa transaction reference numbers (not card numbers or full phone numbers).

**9.2 Data Not Collected.** Angaza does NOT collect or transmit:

(a) Audio recordings — the AI Sermon Assist processes audio entirely on-device;

(b) Presentation content, song lyrics, or Bible search queries;

(c) Video or image files from your media library.

**9.3 Data Storage.** Your data is stored on servers located within the jurisdiction of the hosting provider selected by Angaza. Angaza will make reasonable efforts to ensure your data is stored within secure data centre facilities.

**9.4 Data Sharing.** Angaza does not sell your personal data to third parties. Angaza may share your data with:

(a) Service providers who assist in operating the Software (e.g., email delivery), under confidentiality agreements;

(b) Law enforcement or regulatory authorities where required by applicable law;

(c) Safaricom PLC, to the extent necessary to process M-Pesa transactions.

**9.5 Data Rights.** You have the right to access, correct, or request deletion of your personal data, subject to applicable Kenyan law, including the Data Protection Act, 2019 (Kenya). Requests should be directed to `privacy@angaza.app`.

**9.6 Data Retention.** Your data is retained for the duration of your Subscription plus three (3) years for accounting and audit purposes, after which it is deleted or anonymised.

---

## 10. Warranty Disclaimer

**10.1** THE SOFTWARE IS PROVIDED "AS IS" AND "AS AVAILABLE" WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED. TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, ANGAZA EXPRESSLY DISCLAIMS ALL WARRANTIES, INCLUDING BUT NOT LIMITED TO:

(a) WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT;

(b) WARRANTIES THAT THE SOFTWARE WILL MEET YOUR REQUIREMENTS OR EXPECTATIONS;

(c) WARRANTIES THAT THE SOFTWARE WILL OPERATE WITHOUT INTERRUPTION, ERROR, OR DEFECT;

(d) WARRANTIES REGARDING THE ACCURACY OF AI SERMON ASSIST TRANSCRIPTION OR VERSE DETECTION;

(e) WARRANTIES REGARDING THE ACCURACY OF BIBLE TEXT CONTENT.

**10.2** SOME JURISDICTIONS DO NOT ALLOW THE EXCLUSION OF IMPLIED WARRANTIES. TO THE EXTENT SUCH EXCLUSIONS ARE NOT PERMITTED, THOSE WARRANTIES ARE LIMITED TO THE MINIMUM SCOPE REQUIRED BY APPLICABLE LAW.

---

## 11. Limitation of Liability

**11.1** TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE KENYAN LAW, ANGAZA'S TOTAL CUMULATIVE LIABILITY TO YOU FOR ANY CLAIMS ARISING UNDER OR IN CONNECTION WITH THIS AGREEMENT SHALL NOT EXCEED THE TOTAL SUBSCRIPTION FEES PAID BY YOU IN THE THREE (3) MONTHS IMMEDIATELY PRECEDING THE EVENT GIVING RISE TO THE CLAIM.

**11.2** IN NO EVENT SHALL ANGAZA BE LIABLE FOR ANY INDIRECT, INCIDENTAL, SPECIAL, CONSEQUENTIAL, OR PUNITIVE DAMAGES, INCLUDING BUT NOT LIMITED TO:

(a) Loss of profits, revenue, or business opportunities;

(b) Disruption to church services or ministry activities;

(c) Loss or corruption of Licensee Content;

(d) Damage arising from reliance on AI Sermon Assist output;

(e) Any damage arising from internet connectivity failures affecting Subscription renewal.

**11.3** These limitations apply regardless of the legal theory under which liability is claimed (contract, tort, strict liability, or otherwise) and even if Angaza has been advised of the possibility of such damages.

---

## 12. Term and Termination

**12.1 Term.** This Agreement commences on the date you first install or use the Software and continues until terminated.

**12.2 Termination by You.** You may terminate this Agreement at any time by uninstalling the Software and ceasing all use. Termination does not entitle you to a refund of any prepaid Subscription fees.

**12.3 Termination by Angaza.** Angaza may terminate this Agreement immediately upon written notice if:

(a) You breach any material term of this Agreement and fail to remedy such breach within fourteen (14) days of written notice;

(b) You attempt to circumvent the Cryptographic Lease system, hardware binding, or any other licensing mechanism;

(c) You use the Software for any unlawful purpose;

(d) You engage in fraudulent activity in connection with the Software or the Marketplace.

**12.4 Effect of Termination.** Upon termination:

(a) All rights granted to you under this Agreement immediately cease;

(b) You must uninstall the Software and delete all copies in your possession;

(c) You lose access to the Creator Marketplace and any purchased Marketplace Themes;

(d) Sections 8, 10, 11, 13, and 14 survive termination.

**12.5 Suspension.** Angaza may suspend your access to the Software without terminating this Agreement if a Subscription payment is overdue, pending investigation of a suspected breach, or for maintenance purposes. Angaza will give reasonable notice of planned maintenance.

---

## 13. Governing Law and Dispute Resolution

**13.1 Governing Law.** This Agreement and any dispute arising out of or in connection with it shall be governed by and construed in accordance with the laws of the Republic of Kenya, without regard to its conflict of law provisions.

**13.2 Jurisdiction.** Subject to Section 13.3, the courts of the Republic of Kenya (sitting in Nairobi) shall have exclusive jurisdiction over any dispute arising out of or in connection with this Agreement.

**13.3 Dispute Resolution.** Before commencing any legal proceedings, the parties agree to attempt to resolve any dispute through good-faith negotiation for a period of thirty (30) days following written notice of the dispute. If the dispute is not resolved within this period, either party may refer the matter to the Nairobi Centre for International Arbitration (NCIA) for arbitration in accordance with the NCIA Arbitration Rules. The language of arbitration shall be English.

**13.4 Consumer Rights.** Nothing in this Agreement limits or excludes any rights you may have under the Consumer Protection Act (Kenya) or other applicable consumer protection legislation.

---

## 14. General Provisions

**14.1 Entire Agreement.** This Agreement, together with the Privacy Policy at `https://angaza.app/privacy` and the Creator Agreement (if applicable), constitutes the entire agreement between you and Angaza regarding the Software and supersedes all prior agreements, representations, and understandings.

**14.2 Amendments.** Angaza may amend this Agreement by providing thirty (30) days' written notice via email or in-app notification. Your continued use of the Software after the effective date of an amendment constitutes acceptance. If you do not accept an amendment, you must stop using the Software and request account deletion.

**14.3 Severability.** If any provision of this Agreement is found to be invalid, illegal, or unenforceable, the remaining provisions shall continue in full force and effect.

**14.4 Waiver.** Failure by Angaza to enforce any right or provision of this Agreement shall not constitute a waiver of that right or provision.

**14.5 Assignment.** You may not assign or transfer this Agreement or any rights granted hereunder to any third party without Angaza's prior written consent. Angaza may assign this Agreement in connection with a merger, acquisition, or sale of all or substantially all of its assets.

**14.6 Force Majeure.** Angaza shall not be liable for any failure or delay in performance resulting from causes beyond its reasonable control, including but not limited to acts of God, power failures, internet outages, Safaricom service disruptions, or actions of governmental authorities.

**14.7 Notices.** Notices to Angaza should be directed to `legal@angaza.app`. Notices to you will be sent to the email address registered on your account. Notices are deemed received: (a) immediately if sent by email and no delivery failure notification is received; (b) five business days after posting if sent by registered mail to the registered address.

**14.8 Relationship of Parties.** Nothing in this Agreement creates a partnership, joint venture, agency, employment, or franchise relationship between the parties.

**14.9 Language.** This Agreement is written in English. Any translation is provided for convenience only. In the event of conflict, the English version prevails.

---

## 15. Contact Information

**Angaza Technologies Ltd.**
Nairobi, Republic of Kenya

| Purpose | Contact |
|---|---|
| General enquiries | `hello@angaza.app` |
| Technical support | `support@angaza.app` |
| Legal and licensing | `legal@angaza.app` |
| Privacy requests | `privacy@angaza.app` |
| Security vulnerabilities | `security@angaza.app` |
| Creator programme | `creators@angaza.app` |

**Website:** `https://angaza.app`

---

*By installing or using Angaza Present, you acknowledge that you have read this Agreement, understand it, and agree to be bound by its terms.*

---

**© 2025 Angaza Technologies Ltd. All rights reserved.**

*Angaza Present — "To Illuminate" — Built for Africa.*
