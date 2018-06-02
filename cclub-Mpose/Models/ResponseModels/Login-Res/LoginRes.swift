/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct LoginRes : Codable {
	let active : Bool?
	let rowId : CLongLong?
	let pos : Pos?
	let sessionString : String?
	let branchId : CLongLong?
	let organizationId : CLongLong?
	let userInfo : UserInfo?
	let ticketString : String?

	enum CodingKeys: String, CodingKey {

		case active = "active"
		case rowId = "rowId"
		case pos
		case sessionString = "sessionString"
		case branchId = "branchId"
		case organizationId = "organizationId"
		case userInfo
		case ticketString = "ticketString"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		active = try values.decodeIfPresent(Bool.self, forKey: .active)
		rowId = try values.decodeIfPresent(CLongLong.self, forKey: .rowId)
		pos = try Pos(from: decoder)
		sessionString = try values.decodeIfPresent(String.self, forKey: .sessionString)
		branchId = try values.decodeIfPresent(CLongLong.self, forKey: .branchId)
		organizationId = try values.decodeIfPresent(CLongLong.self, forKey: .organizationId)
		userInfo = try UserInfo(from: decoder)
		ticketString = try values.decodeIfPresent(String.self, forKey: .ticketString)
	}

}
