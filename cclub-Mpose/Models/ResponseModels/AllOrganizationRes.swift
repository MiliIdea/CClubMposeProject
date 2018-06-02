/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct AllOrganizationRes : Codable {
	let createdBy : CreatedBy?
	let created : String?
	let updatedBy : UpdatedBy?
	let updated : String?
	let accessKey : String?
	let active : Bool?
	let fullTitle : String?
	let rowId : Int?
	let name : String?
	let establishingYear : Int?
	let ownerLastName : String?
	let parentOrg : ParentOrg?
	let tel : String?
	let address : String?
	let code : String?
	let logoImage : LogoImage?
	let email : String?
	let mobileNumber : String?
	let marketerFirstName : String?
	let marketerLastName : String?
	let marketerCode : String?
	let marketerMobile : String?

	enum CodingKeys: String, CodingKey {

		case createdBy
		case created = "created"
		case updatedBy
		case updated = "updated"
		case accessKey = "accessKey"
		case active = "active"
		case fullTitle = "fullTitle"
		case rowId = "rowId"
		case name = "name"
		case establishingYear = "establishingYear"
		case ownerLastName = "ownerLastName"
		case parentOrg
		case tel = "tel"
		case address = "address"
		case code = "code"
		case logoImage
		case email = "email"
		case mobileNumber = "mobileNumber"
		case marketerFirstName = "marketerFirstName"
		case marketerLastName = "marketerLastName"
		case marketerCode = "marketerCode"
		case marketerMobile = "marketerMobile"
	}


}
