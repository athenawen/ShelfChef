import Foundation
import CoreLocation

struct FoodBank: Identifiable, Hashable, Equatable {
    let id: UUID
    let name: String
    let address: String
    let phoneNumber: String
    let website: String
    let state: String
    let email: String
    let coordinate: CLLocationCoordinate2D


    enum CodingKeys: String, CodingKey {
        case id, name, address, phoneNumber, website, state, email, latitude, longitude
    }

    init(name: String, address: String, phoneNumber: String, website: String, state: String, email: String, coordinate: CLLocationCoordinate2D) {
        self.id = UUID()
        self.name = name
        self.address = address
        self.phoneNumber = phoneNumber
        self.website = website
        self.state = state
        self.email = email
        self.coordinate = coordinate
    }

    // Equatable implementation
    static func == (lhs: FoodBank, rhs: FoodBank) -> Bool {
        return lhs.id == rhs.id &&
               lhs.name == rhs.name &&
               lhs.address == rhs.address &&
               lhs.phoneNumber == rhs.phoneNumber &&
               lhs.website == rhs.website &&
               lhs.state == rhs.state &&
               lhs.email == rhs.email &&
               lhs.coordinate.latitude == rhs.coordinate.latitude &&
               lhs.coordinate.longitude == rhs.coordinate.longitude
    }

    // Hashable implementation
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(address)
        hasher.combine(phoneNumber)
        hasher.combine(website)
        hasher.combine(state)
        hasher.combine(email)
        hasher.combine(coordinate.latitude)
        hasher.combine(coordinate.longitude)
    }
}

    class FoodBankStore {
        func getAllFoodBanks() -> [FoodBank] {
            return [
                FoodBank(
                    name: "Community Food Bank of Central Alabama",
                    address: "107 Walter Davis Drive, Birmingham, AL 35209",
                    phoneNumber: "205.942.8911",
                    website: "https://www.feedingal.org/",
                    state: "Alabama",
                    email: "info@feedingal.org",
                    coordinate: CLLocationCoordinate2D(latitude: 33.5207, longitude: -86.8025)
                ),
            FoodBank(
                name: "Food Bank of North Alabama",
                address: "225 Finney Drive SW, P.O. Box 18607, Huntsville, AL 35824",
                phoneNumber: "256.539.2256",
                website: "https://www.foodbanknorthal.org/",
                state: "Alabama",
                email: "info@foodbanknorthal.org",
                coordinate: CLLocationCoordinate2D(latitude: 32.3604, longitude: -86.3428)

            ),
                    FoodBank(
                        name: "Heart of Alabama Food Bank",
                        address: "521 Trade Center Street, Montgomery, AL 36108",
                        phoneNumber: "334.263.3784",
                        website: "https://hafb.org/",
                        state: "Alabama",
                        email: "info@hafb.org",
                        coordinate: CLLocationCoordinate2D(latitude: 32.3575, longitude: -86.3253)
                    ),
                    FoodBank(
                        name: "Feeding the Gulf Coast",
                        address: "5248 Mobile South Street, Theodore, AL 36582",
                        phoneNumber: "251.653.1617",
                        website: "https://www.feedingthegulfcoast.org/",
                        state: "Alabama",
                        email: "info@feedingthegulfcoast.org",
                        coordinate: CLLocationCoordinate2D(latitude: 30.5640, longitude: -88.1653)
                    ),
                    FoodBank(
                        name: "River Valley Regional Food Bank",
                        address: "1617 South Zero Street, PO Box 180070, Ft. Smith, AR 72918",
                        phoneNumber: "479.785.0582",
                        website: "https://www.rvrfoodbank.org/",
                        state: "Arkansas",
                        email: "info@rvrfoodbank.org",
                        coordinate: CLLocationCoordinate2D(latitude: 35.3643, longitude: -94.3959)
                    ),
                    FoodBank(
                        name: "Food Bank of Northeast Arkansas",
                        address: "3414 One Place, P.O. Box 2097, Jonesboro, AR 72402",
                        phoneNumber: "870.932.3663",
                        website: "https://www.foodbankofnea.org/",
                        state: "Arkansas",
                        email: "info@foodbankofnea.org",
                        coordinate: CLLocationCoordinate2D(latitude: 35.8207, longitude: -90.6960)
                    ),
                    FoodBank(
                        name: "Arkansas Foodbank",
                        address: "4301 W 65th St, Little Rock, AR 72209",
                        phoneNumber: "501.565.8121",
                        website: "https://arkansasfoodbank.org/",
                        state: "Arkansas",
                        email: "info@arkansasfoodbank.org",
                        coordinate: CLLocationCoordinate2D(latitude: 34.6850, longitude: -92.3166)
                    ),
                    FoodBank(
                        name: "Northwest Arkansas Food Bank",
                        address: "1604 Honeysuckle Street, Lowell, AR 72745",
                        phoneNumber: "479.872.8774",
                        website: "https://www.nwafoodbank.org/",
                        state: "Arkansas",
                        email: "info@nwafoodbank.org",
                        coordinate: CLLocationCoordinate2D(latitude: 36.2555, longitude: -94.1344)
                    ),
                    FoodBank(
                        name: "Harvest Regional Food Bank, Inc.",
                        address: "3120 East 19th Street, P.O. Box 707, Texarkana, AR 71854",
                        phoneNumber: "870.774.1398",
                        website: "https://www.harvestregionalfoodbank.org/",
                        state: "Arkansas",
                        email: "info@harvestregionalfoodbank.org",
                        coordinate: CLLocationCoordinate2D(latitude: 33.4403, longitude: -94.0319)
                    ),
                    FoodBank(
                        name: "United Food Bank",
                        address: "245 South Nina Drive, Mesa, AZ 85210",
                        phoneNumber: "480.926.4897",
                        website: "https://www.unitedfoodbank.org/",
                        state: "Arizona",
                        email: "info@unitedfoodbank.org",
                        coordinate: CLLocationCoordinate2D(latitude: 33.4070, longitude: -111.8486)
                    ),
                    FoodBank(
                        name: "St. Marys Food Bank",
                        address: "2831 N. 31st Avenue, Phoenix, AZ 85009",
                        phoneNumber: "602.242.3663",
                        website: "https://www.firstfoodbank.org/",
                        state: "Arizona",
                        email: "info@firstfoodbank.org",
                        coordinate: CLLocationCoordinate2D(latitude: 33.4795, longitude: -112.1245)
                    ),
                    FoodBank(
                        name: "Community Food Bank of Southern Arizona",
                        address: "3003 South Country Club Road, Tucson, AZ 85713",
                        phoneNumber: "520.622.0525",
                        website: "https://www.communityfoodbank.org/",
                        state: "Arizona",
                        email: "info@communityfoodbank.org",
                        coordinate: CLLocationCoordinate2D(latitude: 32.2041, longitude: -110.9256)
                    ),
                    FoodBank(
                        name: "Yuma Community Food Bank",
                        address: "2404 E 24th St. Ste. A, Yuma, AZ 85365",
                        phoneNumber: "928.343.1243",
                        website: "https://www.yumafoodbank.org/",
                        state: "Arizona",
                        email: "info@yumafoodbank.org",
                        coordinate: CLLocationCoordinate2D(latitude: 32.6867, longitude: -114.5894)
                    ),
                    FoodBank(
                        name: "Food Bank of Contra Costa and Solano",
                        address: "4010 Nelson Ave, Concord, CA 94520",
                        phoneNumber: "925.676.7543",
                        website: "https://www.foodbankccs.org/",
                        state: "California",
                        email: "info@foodbankccs.org",
                        coordinate: CLLocationCoordinate2D(latitude: 38.0057, longitude: -122.0416)
                    ),
                    FoodBank(
                        name: "Central California Food Bank",
                        address: "4010 E. Amendola Ave., Fresno, CA 93725",
                        phoneNumber: "559.237.3663",
                        website: "https://www.ccfoodbank.org/",
                        state: "California",
                        email: "info@ccfoodbank.org",
                        coordinate: CLLocationCoordinate2D(latitude: 36.7052, longitude: -119.7363)
                    ),
                    FoodBank(
                        name: "FIND Food Bank",
                        address: "83-775 Citrus Ave, P.O. Box 10080, Indio, CA 92202",
                        phoneNumber: "760.775.3663",
                        website: "https://www.findfoodbank.org/",
                        state: "California",
                        email: "info@findfoodbank.org",
                        coordinate: CLLocationCoordinate2D(latitude: 33.7198, longitude: -116.2156)
                    ),
                    FoodBank(
                        name: "Second Harvest Food Bank of Orange County",
                        address: "8014 Marine Way, Irvine, CA 92618",
                        phoneNumber: "949.653.2900",
                        website: "https://www.feedoc.org/",
                        state: "California",
                        email: "info@feedoc.org",
                        coordinate: CLLocationCoordinate2D(latitude: 33.6607, longitude: -117.7535)
                    ),
                    FoodBank(
                        name: "Los Angeles Regional Food Bank",
                        address: "1734 E. 41st Street, Los Angeles, CA 90058",
                        phoneNumber: "323.234.3030",
                        website: "https://www.lafoodbank.org/",
                        state: "California",
                        email: "info@lafoodbank.org",
                        coordinate: CLLocationCoordinate2D(latitude: 34.0094, longitude: -118.2305)
                    ),
                    FoodBank(
                        name: "Second Harvest of the Greater Valley",
                        address: "1220 Vanderbilt Cir, Manteca, CA 95337",
                        phoneNumber: "209.239.2091",
                        website: "https://www.localfoodbank.org/",
                        state: "California",
                        email: "info@localfoodbank.org",
                        coordinate: CLLocationCoordinate2D(latitude: 37.8211, longitude: -121.2161)
                    ),
                    FoodBank(
                        name: "Alameda County Community Food Bank",
                        address: "7900 Edgewater Drive, P.O. Box 2599, Oakland, CA 94621",
                        phoneNumber: "510.635.3663",
                        website: "https://www.accfb.org/",
                        state: "California",
                        email: "info@accfb.org",
                        coordinate: CLLocationCoordinate2D(latitude: 37.7377, longitude: -122.1951)
                    ),
                FoodBank(
                    name: "Food Share, Inc",
                    address: "4156 Southbank Road Oxnard, CA 93036",
                    phoneNumber: "805.983.7100",
                    website: "foodshare.com",
                    state: "California",
                    email: "info@foodshare.com",
                    coordinate: CLLocationCoordinate2D(latitude: 34.2506, longitude: -119.1771)
                ),
                FoodBank(
                    name: "Feeding America Riverside | San Bernardino Counties",
                    address: "2950 - A Jefferson Street, Riverside, CA 92504",
                    phoneNumber: "951.359.4757",
                    website: "https://www.feedingamericaie.org/",
                    state: "California",
                    email: "info@feedingamericaie.org",
                    coordinate: CLLocationCoordinate2D(latitude: 33.9380, longitude: -117.4103)
                ),
                FoodBank(
                    name: "Feeding the Foothills",
                    address: "8284 Industrial Ave, Roseville, CA 95678",
                    phoneNumber: "916.783.0481",
                    website: "https://feedingthefoothills.org/",
                    state: "California",
                    email: "contact@feedingthefoothills.org",
                    coordinate: CLLocationCoordinate2D(latitude: 38.7440, longitude: -121.2874)
                ),
                FoodBank(
                    name: "Food Bank for Monterey County",
                    address: "815 W. Market Street, Suite 5, Salinas, CA 93901",
                    phoneNumber: "831.758.1523",
                    website: "https://www.foodbankformontereycounty.org/",
                    state: "California",
                    email: "info@foodbankformontereycounty.org",
                    coordinate: CLLocationCoordinate2D(latitude: 36.6762, longitude: -121.6605)
                ),
                FoodBank(
                    name: "SF-Marin Food Bank",
                    address: "900 Pennsylvania Avenue, San Francisco, CA 94107",
                    phoneNumber: "415.282.1900",
                    website: "https://www.sfmfoodbank.org/",
                    state: "California",
                    email: "info@sfmfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 37.7546, longitude: -122.3933)
                ),
                FoodBank(
                    name: "Second Harvest of Silicon Valley",
                    address: "750 Curtner Avenue, San Jose, CA 95125",
                    phoneNumber: "408.266.8866",
                    website: "https://www.SHFB.org/",
                    state: "California",
                    email: "info@shfb.org",
                    coordinate: CLLocationCoordinate2D(latitude: 37.2981, longitude: -121.8737)
                ),
                FoodBank(
                    name: "Foodbank of Santa Barbara County",
                    address: "4554 Hollister Avenue, Santa Barbara, CA 93110",
                    phoneNumber: "805.967.5741",
                    website: "https://foodbanksbc.org/",
                    state: "California",
                    email: "info@foodbanksbc.org",
                    coordinate: CLLocationCoordinate2D(latitude: 34.4386, longitude: -119.8067)
                ),
                FoodBank(
                    name: "Redwood Empire Food Bank",
                    address: "3990 Brickway Blvd, Santa Rosa, CA 95403",
                    phoneNumber: "707.523.7900",
                    website: "https://www.refb.org/",
                    state: "California",
                    email: "info@refb.org",
                    coordinate: CLLocationCoordinate2D(latitude: 38.5141, longitude: -122.7904)
                ),
                FoodBank(
                    name: "Second Harvest Food Bank Santa Cruz County",
                    address: "800 Ohlone Parkway, Watsonville, CA 95076",
                    phoneNumber: "831.722.7110",
                    website: "https://www.thefoodbank.org/",
                    state: "California",
                    email: "info@thefoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 36.9187, longitude: -121.7465)
                ),
                FoodBank(
                    name: "Care and Share Food Bank",
                    address: "2605 Preamble Point, Colorado Springs, CO 80915",
                    phoneNumber: "719.528.1247",
                    website: "https://careandshare.org/",
                    state: "Colorado",
                    email: "info@careandshare.org",
                    coordinate: CLLocationCoordinate2D(latitude: 38.8610, longitude: -104.7327)
                ),
                FoodBank(
                    name: "Food Bank of the Rockies",
                    address: "10700 E. 45th Ave, Denver, CO 80239",
                    phoneNumber: "303.371.9250",
                    website: "https://www.foodbankrockies.org/",
                    state: "Colorado",
                    email: "info@foodbankrockies.org",
                    coordinate: CLLocationCoordinate2D(latitude: 39.7780, longitude: -104.8679)
                ),
                FoodBank(
                    name: "Weld Food Bank",
                    address: "1108 H Street, Greeley, CO 80631",
                    phoneNumber: "970.356.2199",
                    website: "https://www.weldfoodbank.org/",
                    state: "Colorado",
                    email: "info@weldfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 40.4233, longitude: -104.6990)
                ),
                FoodBank(
                    name: "Community Food Share",
                    address: "650 S. Taylor Ave., Louisville, CO 80027",
                    phoneNumber: "303.652.3663",
                    website: "https://communityfoodshare.org/",
                    state: "Colorado",
                    email: "info@communityfoodshare.org",
                    coordinate: CLLocationCoordinate2D(latitude: 39.9643, longitude: -105.1317)
                ),
                FoodBank(
                    name: "Food Bank for Larimer County",
                    address: "5706 Wright Drive, Loveland, CO 80538",
                    phoneNumber: "970.493.4477",
                    website: "https://foodbanklarimer.org/",
                    state: "Colorado",
                    email: "info@foodbanklarimer.org",
                    coordinate: CLLocationCoordinate2D(latitude: 40.4245, longitude: -104.9896)
                ),
                FoodBank(
                    name: "Connecticut Foodshare",
                    address: "2 Research Parkway, Wallingford, CT 06492",
                    phoneNumber: "203.469.5000",
                    website: "https://www.ctfoodshare.org/",
                    state: "Connecticut",
                    email: "info@ctfoodshare.org",
                    coordinate: CLLocationCoordinate2D(latitude: 41.4815, longitude: -72.8217)
                ),
                FoodBank(
                    name: "Capital Area Food Bank",
                    address: "4900 Puerto Rico Ave NE, Washington, DC 20017",
                    phoneNumber: "202.644.9800",
                    website: "https://www.capitalareafoodbank.org/",
                    state: "District of Columbia",
                    email: "info@capitalareafoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 38.9481, longitude: -77.0023)
                ),
                FoodBank(
                    name: "Food Bank of Delaware",
                    address: "222 Lake Drive, Newark, DE 19702",
                    phoneNumber: "302.292.1305",
                    website: "https://www.fbd.org/",
                    state: "Delaware",
                    email: "info@fbd.org",
                    coordinate: CLLocationCoordinate2D(latitude: 39.6425, longitude: -75.7335)
                ),
                FoodBank(
                    name: "Harry Chapin Food Bank of Southwest Florida",
                    address: "3760 Fowler St., Ft. Myers, FL 33901",
                    phoneNumber: "239.334.7007",
                    website: "https://harrychapinfoodbank.org/",
                    state: "Florida",
                    email: "info@harrychapinfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 26.6094, longitude: -81.8599)
                ),
                FoodBank(
                    name: "Treasure Coast Food Bank",
                    address: "401 Angle Rd., Ft. Pierce, FL 34947",
                    phoneNumber: "772.489.3034",
                    website: "https://www.stophunger.org/",
                    state: "Florida",
                    email: "info@stophunger.org",
                    coordinate: CLLocationCoordinate2D(latitude: 27.4605, longitude: -80.3454)
                ),
                FoodBank(
                    name: "Feeding Northeast Florida",
                    address: "1116 Edgewood Avenue North, Units D and E, Jacksonville, FL 32254",
                    phoneNumber: "904.513.1333",
                    website: "https://www.FeedingNEFL.org/",
                    state: "Florida",
                    email: "info@feedingnefl.org",
                    coordinate: CLLocationCoordinate2D(latitude: 30.3431, longitude: -81.7221)
                ),
                FoodBank(
                    name: "Second Harvest Food Bank of Central Florida",
                    address: "411 Mercy Drive, Orlando, FL 32805",
                    phoneNumber: "407.295.1066",
                    website: "https://www.feedhopenow.org/",
                    state: "Florida",
                    email: "info@feedhopenow.org",
                    coordinate: CLLocationCoordinate2D(latitude: 28.5516, longitude: -81)
                    ),

                FoodBank(
                    name: "Feeding South Florida",
                    address: "2501 SW 32 Terrace, Pembroke Park, FL 33023",
                    phoneNumber: "954.518.1818",
                    website: "https://www.feedingsouthflorida.org/",
                    state: "Florida",
                    email: "info@feedingsouthflorida.org",
                    coordinate: CLLocationCoordinate2D(latitude: 25.9874, longitude: -80.1786)
                ),
                FoodBank(
                    name: "All Faiths Food Bank",
                    address: "8171 Blaikie Ct, Sarasota, FL 34240",
                    phoneNumber: "941.379.6333",
                    website: "https://www.allfaithsfoodbank.org/",
                    state: "Florida",
                    email: "info@allfaithsfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 27.3142, longitude: -82.4406)
                ),
                FoodBank(
                    name: "Second Harvest of the Big Bend, Inc.",
                    address: "4446 Entrepot Blvd, Tallahassee, FL 32310",
                    phoneNumber: "850.562.3033",
                    website: "https://fightinghunger.org/",
                    state: "Florida",
                    email: "info@fightinghunger.org",
                    coordinate: CLLocationCoordinate2D(latitude: 30.4224, longitude: -84.3540)
                ),
                FoodBank(
                    name: "Feeding Tampa Bay",
                    address: "3624 Causeway Blvd, Tampa, FL 33619",
                    phoneNumber: "813.254.1190",
                    website: "https://www.feedingtampabay.org/",
                    state: "Florida",
                    email: "info@feedingtampabay.org",
                    coordinate: CLLocationCoordinate2D(latitude: 27.9252, longitude: -82.3927)
                ),
                FoodBank(
                    name: "Food Bank of Northeast Georgia",
                    address: "861 Newton Bridge Road, P.O. Box 48857, Athens, GA 30607",
                    phoneNumber: "706.354.8191",
                    website: "https://foodbanknega.org/",
                    state: "Georgia",
                    email: "info@foodbanknega.org",
                    coordinate: CLLocationCoordinate2D(latitude: 33.9825, longitude: -83.3871)
                ),
                FoodBank(
                    name: "Atlanta Community Food Bank",
                    address: "3400 N Desert Dr, Atlanta, GA 30344",
                    phoneNumber: "404.892.9822",
                    website: "https://www.acfb.org/",
                    state: "Georgia",
                    email: "info@acfb.org",
                    coordinate: CLLocationCoordinate2D(latitude: 33.6561, longitude: -84.4241)
                ),
                FoodBank(
                    name: "Golden Harvest Food Bank",
                    address: "3310 Commerce Drive, Augusta, GA 30909",
                    phoneNumber: "706.736.1199",
                    website: "https://www.goldenharvest.org/",
                    state: "Georgia",
                    email: "info@goldenharvest.org",
                    coordinate: CLLocationCoordinate2D(latitude: 33.4654, longitude: -82.0715)
                ),
                FoodBank(
                    name: "Middle Georgia Community Food Bank",
                    address: "4490 Ocmulgee East Boulevard, PO Box 5024, Macon, GA 31217",
                    phoneNumber: "478.742.3958",
                    website: "https://mgcfb.org/",
                    state: "Georgia",
                    email: "info@mgcfb.org",
                    coordinate: CLLocationCoordinate2D(latitude: 32.8747, longitude: -83.5485)
                ),
                FoodBank(
                    name: "Feeding the Valley Food Bank",
                    address: "6744 Flat Rock Road, Midland, GA 31820",
                    phoneNumber: "706.561.4755",
                    website: "https://feedingthevalley.org/",
                    state: "Georgia",
                    email: "info@feedingthevalley.org",
                    coordinate: CLLocationCoordinate2D(latitude: 32.5158, longitude: -84.8777)
                ),
                FoodBank(
                    name: "Second Harvest of Coastal Georgia",
                    address: "1380 Chatham Parkway, Savannah, GA 31405",
                    phoneNumber: "912.236.6750",
                    website: "https://www.helpendhunger.org/",
                    state: "Georgia",
                    email: "info@helpendhunger.org",
                    coordinate: CLLocationCoordinate2D(latitude: 32.0603, longitude: -81.1699)
                ),
                FoodBank(
                    name: "Second Harvest of South Georgia",
                    address: "1411 Harbin Circle, Valdosta, GA 31601",
                    phoneNumber: "229.244.2678",
                    website: "https://feedingsga.org/",
                    state: "Georgia",
                    email: "info@feedingsga.org",
                    coordinate: CLLocationCoordinate2D(latitude: 30.8113, longitude: -83.2763)
                ),
                FoodBank(
                    name: "Hawaii Foodbank, Inc.",
                    address: "2611 Kilihau St, Honolulu, HI 96819",
                    phoneNumber: "808.836.3600",
                    website: "https://hawaiifoodbank.org/",
                    state: "Hawaii",
                    email: "info@hawaiifoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 21.3348, longitude: -157.8836)
                ),
                FoodBank(
                    name: "River Bend Food Bank",
                    address: "4010 Kimmel Drive, Davenport, IA 52802",
                    phoneNumber: "563.345.6490",
                    website: "https://riverbendfoodbank.org/",
                    state: "Iowa",
                    email: "info@riverbendfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 41.5121, longitude: -90.6339)
                ),
                FoodBank(
                    name: "Food Bank of Iowa",
                    address: "2220 E. 17th Street, P.O. Box 1517, Des Moines, IA 50316",
                    phoneNumber: "515.564.0330",
                    website: "https://www.foodbankiowa.org/",
                    state: "Iowa",
                    email: "info@foodbankiowa.org",
                    coordinate: CLLocationCoordinate2D(latitude: 41.6027, longitude: -93.5933)
                ),
                FoodBank(
                    name: "HACAP Food Reservoir",
                    address: "1515 Hawkeye Drive, PO Box 490, Hiawatha, IA 52233",
                    phoneNumber: "319.393.7811",
                    website: "https://www.hacap.org/",
                    state: "Iowa",
                    email: "info@hacap.org",
                    coordinate: CLLocationCoordinate2D(latitude: 42.0482, longitude: -91.6692)
                ),
                FoodBank(
                    name: "Northeast Iowa Food Bank",
                    address: "1605 Lafayette Steet, PO Box 2397, Waterloo, IA 50703",
                    phoneNumber: "319.235.0507",
                    website: "https://www.neifb.org/",
                    state: "Iowa",
                    email: "info@neifb.org",
                    coordinate: CLLocationCoordinate2D(latitude: 42.5066, longitude: -92.3443)
                ),
                FoodBank(
                    name: "The Idaho Foodbank",
                    address: "3630 E Commercial Ct, Meridian, ID 83642",
                    phoneNumber: "208.336.9643",
                    website: "https://idahofoodbank.org/",
                    state: "Idaho",
                    email: "info@idahofoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 43.6097, longitude: -116.3687)
                ),
                FoodBank(
                    name: "Greater Chicago Food Depository",
                    address: "4100 West Ann Lurie Place, Chicago, IL 60632",
                    phoneNumber: "773.247.3663",
                    website: "https://www.chicagosfoodbank.org/",
                    state: "Illinois",
                    email: "info@chicagosfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 41.8149, longitude: -87.7251)
                ),
                FoodBank(
                    name: "Northern Illinois Food Bank",
                    address: "273 Dearborn Court, Geneva, IL 60134",
                    phoneNumber: "630.443.6910",
                    website: "https://www.SolveHungerToday.org/",
                    state: "Illinois",
                    email: "info@solvehungertoday.org",
                    coordinate: CLLocationCoordinate2D(latitude: 41.8915, longitude: -88.2851)
                ),
                FoodBank(
                    name: "Central Illinois Foodbank",
                    address: "1937 E. Cook St., Springfield, IL 62703",
                    phoneNumber: "217.522.4022",
                    website: "https://www.centralilfoodbank.org/",
                    state: "Illinois",
                    email: "info@centralilfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 39.8005, longitude: -89.6211)
                ),
                FoodBank(
                    name: "Eastern Illinois Foodbank",
                    address: "2405 North Shore Drive, Urbana, IL 61802",
                    phoneNumber: "217.328.3663",
                    website: "https://www.eifoodbank.org/",
                    state: "Illinois",
                    email: "info@eifoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 40.1350, longitude: -88.1922)
                ),
                FoodBank(
                    name: "Hoosier Hills Food Bank",
                    address: "2333 West Industrial Park Drive, PO Box 697, Bloomington, IN 47404",
                    phoneNumber: "812.334.8374",
                    website: "https://www.hhfoodbank.org",
                    state: "Indiana",
                    email: "info@hhfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 39.1714, longitude: -86.5644)
                ),
                FoodBank(
                    name: "Tri-State Food Bank, Inc.",
                    address: "2504 Lynch Road, Evansville, IN 47711",
                    phoneNumber: "812.425.0775",
                    website: "https://www.tristatefoodbank.org/",
                    state: "Indiana",
                    email: "info@tristatefoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 38.0040, longitude: -87.5112)
                ),
                FoodBank(
                    name: "Community Harvest Food Bank of Northeast Indiana, Inc.",
                    address: "999 East Tillman Road, P.O. Box 10967, Fort Wayne, IN 46816",
                    phoneNumber: "260.447.3696",
                    website: "https://www.communityharvest.org/",
                    state: "Indiana",
                    email: "info@communityharvest.org",
                    coordinate: CLLocationCoordinate2D(latitude: 41.0389, longitude: -85.1255)
                ),
                FoodBank(
                    name: "Gleaners Food Bank of Indiana, Inc.",
                    address: "3737 Waldemere Ave, Indianapolis, IN 46241",
                    phoneNumber: "317.925.0191",
                    website: "https://www.gleaners.org",
                    state: "Indiana",
                    email: "info@gleaners.org",
                    coordinate: CLLocationCoordinate2D(latitude: 39.7320, longitude: -86.2301)
                ),
                FoodBank(
                    name: "Food Finders Food Bank",
                    address: "1204 Greenbush Street, Lafayette, IN 47904",
                    phoneNumber: "765.471.0062",
                    website: "https://www.food-finders.org/",
                    state: "Indiana",
                    email: "info@food-finders.org",
                    coordinate: CLLocationCoordinate2D(latitude: 40.4270, longitude: -86.8777)
                ),
                FoodBank(
                    name: "Food Bank of Northwest Indiana",
                    address: "6490 Broadway, Merrillville, IN 46410",
                    phoneNumber: "219.980.1777",
                    website: "https://www.foodbanknwi.org/",
                    state: "Indiana",
                    email: "info@foodbanknwi.org",
                    coordinate: CLLocationCoordinate2D(latitude: 41.5003, longitude: -87.3357)
                ),
                FoodBank(
                    name: "Second Harvest Food Bank of East Central Indiana",
                    address: "6621 N. Old SR 3, Muncie, IN 47303",
                    phoneNumber: "765.287.8698",
                    website: "https://curehunger.org/",
                    state: "Indiana",
                    email: "info@curehunger.org",
                    coordinate: CLLocationCoordinate2D(latitude: 40.2524, longitude: -85.3800)
                ),
                FoodBank(
                    name: "Food Bank of Northern Indiana",
                    address: "702 South Chapin Street, South Bend, IN 46601",
                    phoneNumber: "574.232.9986",
                    website: "https://feedindiana.org/",
                    state: "Indiana",
                    email: "info@feedindiana.org",
                    coordinate: CLLocationCoordinate2D(latitude: 41.6636, longitude: -86.2627)
                ),
                FoodBank(
                    name: "Terre Haute Catholic Charities Foodbank",
                    address: "430 N 14th 1/2 St, Terre Haute, IN 47807",
                    phoneNumber: "812.232.1447",
                    website: "https://ccthin.org/terre-haute-catholic-charities-foodbank",
                    state: "Indiana",
                    email: "info@ccthin.org",
                    coordinate: CLLocationCoordinate2D(latitude: 39.4717, longitude: -87.4064)
                ),
                FoodBank(
                    name: "Kansas Food Bank",
                    address: "1919 E. Douglas, Wichita, KS 67211",
                    phoneNumber: "316.265.3663",
                    website: "https://www.kansasfoodbank.org",
                    state: "Kansas",
                    email: "info@kansasfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 37.6869, longitude: -97.3179)
                ),
                FoodBank(
                    name: "Feeding America, Kentucky’s Heartland",
                    address: "313 Peterson Dr., PO Box 821, Elizabethtown, KY 42701",
                    phoneNumber: "270.769.6997",
                    website: "https://feedingamericaky.org/",
                    state: "Kentucky",
                    email: "info@feedingamericaky.org",
                    coordinate: CLLocationCoordinate2D(latitude: 37.7041, longitude: -85.8803)
                ),
                FoodBank(
                    name: "God's Pantry Food Bank, Inc.",
                    address: "1685 Jaggie Fox Way, Lexington, KY 40511",
                    phoneNumber: "859.255.6592",
                    website: "https://godspantry.org/",
                    state: "Kentucky",
                    email: "info@godspantry.org",
                    coordinate: CLLocationCoordinate2D(latitude: 38.0746, longitude: -84.5334)
                ),
                FoodBank(
                    name: "Dare to Care Food Bank",
                    address: "5803 Fern Valley Road, PO Box 35458, Louisville, KY 40228",
                    phoneNumber: "502.966.3821",
                    website: "https://daretocare.org/",
                    state: "Kentucky",
                    email: "info@daretocare.org",
                    coordinate: CLLocationCoordinate2D(latitude: 38.1366, longitude: -85.6526)
                ),
                FoodBank(
                    name: "Food Bank of Central Louisiana",
                    address: "3223 Baldwin Avenue, Alexandria, LA 71301",
                    phoneNumber: "318.445.2773",
                    website: "https://www.fbcenla.org/",
                    state: "Louisiana",
                    email: "info@fbcenla.org",
                    coordinate: CLLocationCoordinate2D(latitude: 31.2867, longitude: -92.4685)
                ),
                FoodBank(
                    name: "Greater Baton Rouge Food Bank",
                    address: "10600 S. Choctaw Drive, Post Office Box 45830, Baton Rouge, LA 70815",
                    phoneNumber: "225.359.9940",
                    website: "https://brfoodbank.org/",
                    state: "Louisiana",
                    email: "info@brfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 30.4900, longitude: -91.1035)
                ),
                FoodBank(
                    name: "Food Bank of Northeast Louisiana",
                    address: "4600 Central Ave, PO Box 5048, Monroe, LA 71211",
                    phoneNumber: "318.322.3567",
                    website: "https://www.foodbanknela.org/",
                    state: "Louisiana",
                    email: "info@foodbanknela.org",
                    coordinate: CLLocationCoordinate2D(latitude: 32.5311, longitude: -92.0900)
                ),
                FoodBank(
                    name: "Second Harvest Food Bank of Greater New Orleans and Acadiana",
                    address: "700 Edwards Avenue, New Orleans, LA 70123",
                    phoneNumber: "504.734.1322",
                    website: "https://no-hunger.org/",
                    state: "Louisiana",
                    email: "info@no-hunger.org",
                    coordinate: CLLocationCoordinate2D(latitude: 29.9574, longitude: -90.1981)
                ),
                FoodBank(
                    name: "Food Bank of Northwest Louisiana",
                    address: "2307 Texas Avenue, Shreveport, LA 71103",
                    phoneNumber: "318.675.2400",
                    website: "https://www.foodbanknla.org/",
                    state: "Louisiana",
                    email: "info@foodbanknla.org",
                    coordinate: CLLocationCoordinate2D(latitude: 32.4985, longitude: -93.7825)
                ),
                FoodBank(
                    name: "The Greater Boston Food Bank",
                    address: "70 South Bay Ave, Boston, MA 02118",
                    phoneNumber: "617.427.5200",
                    website: "https://www.gbfb.org",
                    state: "Massachusetts",
                    email: "info@gbfb.org",
                    coordinate: CLLocationCoordinate2D(latitude: 42.3304, longitude: -71.0637)
                ),
                FoodBank(
                    name: "The Food Bank of Western Massachusetts",
                    address: "25 Carew Street, PO Box 160, Chicopee, MA 01020",
                    phoneNumber: "413.247.9738",
                    website: "https://www.foodbankwma.org/",
                    state: "Massachusetts",
                    email: "info@foodbankwma.org",
                    coordinate: CLLocationCoordinate2D(latitude: 42.1487, longitude: -72.5922)
                ),
                FoodBank(
                    name: "Worcester County Food Bank, Inc.",
                    address: "474 Boston Turnpike, Shrewsbury, MA 01545",
                    phoneNumber: "508.842.3663",
                    website: "https://foodbank.org/",
                    state: "Massachusetts",
                    email: "info@foodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 42.2861, longitude: -71.7117)
                ),
                FoodBank(
                    name: "Maryland Food Bank",
                    address: "2200 Halethorpe Farms Road, Baltimore, MD 21227",
                    phoneNumber: "410.737.8282",
                    website: "https://mdfoodbank.org/",
                    state: "Maryland",
                    email: "info@mdfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 39.2375, longitude: -76.6699)
                ),
                FoodBank(
                    name: "Good Shepherd Food Bank",
                    address: "3121 Hotel Road, PO Box 1807, Auburn, ME 04211",
                    phoneNumber: "207.782.3554",
                    website: "https://www.gsfb.org/",
                    state: "Maine",
                    email: "info@gsfb.org",
                    coordinate: CLLocationCoordinate2D(latitude: 44.0630, longitude: -70.2389)
                ),
                FoodBank(
                    name: "Food Gatherers",
                    address: "1 Carrot Way, P.O. Box 131037, Ann Arbor, MI 48105",
                    phoneNumber: "734.761.2796",
                    website: "https://www.foodgatherers.org",
                    state: "Michigan",
                    email: "info@foodgatherers.org",
                    coordinate: CLLocationCoordinate2D(latitude: 42.3194, longitude: -83.7081)
                ),
                FoodBank(
                    name: "Greater Lansing Food Bank",
                    address: "5600 Food Court, Bath, MI 48808",
                    phoneNumber: "517.853.7800",
                    website: "https://greaterlansingfoodbank.org/",
                    state: "Michigan",
                    email: "info@greaterlansingfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 42.8135, longitude: -84.4561)
                ),
                FoodBank(
                    name: "South Michigan Food Bank",
                    address: "5451 Wayne Road, Battle Creek, MI 49037",
                    phoneNumber: "269.964.3663",
                    website: "https://smfoodbank.org/",
                    state: "Michigan",
                    email: "info@smfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 42.3534, longitude: -85.1925)
                ),
                FoodBank(
                    name: "Feeding America West Michigan",
                    address: "864 West River Center Drive NE, Comstock Park, MI 49321",
                    phoneNumber: "616.784.3250",
                    website: "https://www.FeedWM.org",
                    state: "Michigan",
                    email: "info@feedwm.org",
                    coordinate: CLLocationCoordinate2D(latitude: 43.0451, longitude: -85.6541)
                ),
                FoodBank(
                    name: "St. Louis Area Foodbank",
                    address: "70 Corporate Woods Drive, Bridgeton, MO 63044",
                    phoneNumber: "314.292.6262",
                    website: "https://stlfoodbank.org/",
                    state: "Missouri",
                    email: "info@stlfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 38.7622, longitude: -90.4202)
                ),
                FoodBank(
                    name: "The Food Bank for Central & Northeast Missouri",
                    address: "2101 Vandiver Drive, Suite B, Columbia, MO 65202",
                    phoneNumber: "573.474.1020",
                    website: "https://www.sharefoodbringhope.org",
                    state: "Missouri",
                    email: "info@sharefoodbringhope.org",
                    coordinate: CLLocationCoordinate2D(latitude: 38.9732, longitude: -92.3040)
                ),
                FoodBank(
                    name: "Harvesters - The Community Food Network",
                    address: "3801 Topping Avenue, Kansas City, MO 64129",
                    phoneNumber: "816.929.3000",
                    website: "https://www.harvesters.org/",
                    state: "Missouri",
                    email: "info@harvesters.org",
                    coordinate: CLLocationCoordinate2D(latitude: 39.0597, longitude: -94.5245)
                ),
                FoodBank(
                    name: "Southeast Missouri Food Bank",
                    address: "600 State Highway H, PO Box 190, Sikeston, MO 63801",
                    phoneNumber: "885.703.3663",
                    website: "https://www.semofoodbank.org/",
                    state: "Missouri",
                    email: "info@semofoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 36.8529, longitude: -89.5907)
                ),
                FoodBank(
                    name: "Ozarks Food Harvest",
                    address: "2810 N. Cedarbrook Ave, Springfield, MO 65803",
                    phoneNumber: "417.865.3411",
                    website: "https://www.ozarksfoodharvest.org",
                    state: "Missouri",
                    email: "info@ozarksfoodharvest.org",
                    coordinate: CLLocationCoordinate2D(latitude: 37.2432, longitude: -93.2506)
                ),
                FoodBank(
                    name: "Second Harvest Community Food Bank",
                    address: "915 Douglas, St. Joseph, MO 64505",
                    phoneNumber: "816.364.3663",
                    website: "https://www.shcfb.org/",
                    state: "Missouri",
                    email: "info@shcfb.org",
                    coordinate: CLLocationCoordinate2D(latitude: 39.7763, longitude: -94.8380)
                ),
                FoodBank(
                    name: "Mississippi Food Network",
                    address: "440 W. Beatty Street, PO Box 411, Jackson, MS 39201",
                    phoneNumber: "601.353.7286",
                    website: "https://www.msfoodnet.org/",
                    state: "Mississippi",
                    email: "info@msfoodnet.org",
                    coordinate: CLLocationCoordinate2D(latitude: 32.3143, longitude: -90.2109)
                ),
                FoodBank(
                    name: "Montana Food Bank Network",
                    address: "5625 Expressway, Missoula, MT 59808",
                    phoneNumber: "406.721.3825",
                    website: "https://mfbn.org/",
                    state: "Montana",
                    email: "info@mfbn.org",
                    coordinate: CLLocationCoordinate2D(latitude: 46.9166, longitude: -114.0498)
                ),
                FoodBank(
                    name: "MANNA FoodBank",
                    address: "627 Swannanoa River Rd, Asheville, NC 28805",
                    phoneNumber: "828.299.3663",
                    website: "https://www.mannafoodbank.org/",
                    state: "North Carolina",
                    email: "info@mannafoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 35.5745, longitude: -82.5103)
                ),
                FoodBank(
                    name: "Second Harvest Food Bank of Metrolina",
                    address: "500 B Spratt St., Charlotte, NC 28206",
                    phoneNumber: "704.376.1785",
                    website: "https://www.secondharvestmetrolina.org/",
                    state: "North Carolina",
                    email: "info@secondharvestmetrolina.org",
                    coordinate: CLLocationCoordinate2D(latitude: 35.2360, longitude: -80.8345)
                ),
                FoodBank(
                    name: "Food Bank of the Albemarle",
                    address: "109 Tidewater Way, PO Box 1704, Elizabeth City, NC 27906",
                    phoneNumber: "252.335.4035",
                    website: "https://www.afoodbank.org/",
                    state: "North Carolina",
                    email: "info@afoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 36.2812, longitude: -76.2403)
                ),
                FoodBank(
                    name: "Second Harvest Food Bank of Southeast North Carolina",
                    address: "406 Deep Creek Road, PO Box 2009, Fayetteville, NC 28302",
                    phoneNumber: "910.485.8809",
                    website: "https://hungercantwait.org",
                    state: "North Carolina",
                    email: "info@hungercantwait.org",
                    coordinate: CLLocationCoordinate2D(latitude: 35.0699, longitude: -78.8622)
                ),
                FoodBank(
                    name: "Food Bank of Central & Eastern North Carolina",
                    address: "1924 Capital Boulevard, Raleigh, NC 27604",
                    phoneNumber: "919.875.0707",
                    website: "https://foodbankcenc.org/",
                    state: "North Carolina",
                    email: "info@foodbankcenc.org",
                    coordinate: CLLocationCoordinate2D(latitude: 35.8016, longitude: -78.6233)
                ),
                FoodBank(
                    name: "Inter-Faith Food Shuttle",
                    address: "1001 Blair Drive, Raleigh, NC 27603",
                    phoneNumber: "919.250.0043",
                    website: "https://www.foodshuttle.org/",
                    state: "North Carolina",
                    email: "info@foodshuttle.org",
                    coordinate: CLLocationCoordinate2D(latitude: 35.7642, longitude: -78.6644)
                ),
                FoodBank(
                    name: "Second Harvest Food Bank of Northwest North Carolina",
                    address: "3330 Shorefair Drive, Winston-Salem, NC 27105",
                    phoneNumber: "336.784.5770",
                    website: "https://www.secondharvestnwnc.org/",
                    state: "North Carolina",
                    email: "info@secondharvestnwnc.org",
                    coordinate: CLLocationCoordinate2D(latitude: 36.1351, longitude: -80.2458)
                ),
                FoodBank(
                    name: "Great Plains Food Bank",
                    address: "1720 3rd Avenue North, Fargo, ND 58102",
                    phoneNumber: "701.232.6219",
                    website: "https://www.greatplainsfoodbank.org/",
                    state: "North Dakota",
                    email: "info@greatplainsfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 46.8787, longitude: -96.7939)
                ),
                FoodBank(
                    name: "Food Bank of Lincoln",
                    address: "1221 Kingbird Road, Lincoln, NE 68521",
                    phoneNumber: "402.466.8170",
                    website: "https://www.lincolnfoodbank.org/",
                    state: "Nebraska",
                    email: "info@lincolnfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 40.8692, longitude: -96.6749)
                ),
                FoodBank(
                    name: "Food Bank for the Heartland",
                    address: "10525 J Street, Omaha, NE 68127",
                    phoneNumber: "402.331.1213",
                    website: "https://foodbankheartland.org/",
                    state: "Nebraska",
                    email: "info@foodbankheartland.org",
                    coordinate: CLLocationCoordinate2D(latitude: 41.2107, longitude: -96.0831)
                ),
                FoodBank(
                    name: "New Hampshire Food Bank",
                    address: "700 East Industrial Park Drive, Manchester, NH 03109",
                    phoneNumber: "603.669.9725",
                    website: "https://www.nhfoodbank.org",
                    state: "New Hampshire",
                    email: "info@nhfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 42.9730, longitude: -71.4317)
                ),
                FoodBank(
                    name: "Community Foodbank of New Jersey",
                    address: "31 Evans Terminal, Hillside, NJ 07205",
                    phoneNumber: "908.355.3663",
                    website: "https://cfbnj.org/",
                    state: "New Jersey",
                    email: "info@cfbnj.org",
                    coordinate: CLLocationCoordinate2D(latitude: 40.6797, longitude: -74.2287)
                ),
                FoodBank(
                    name: "Fulfill",
                    address: "3300 Route 66, Neptune, NJ 07753",
                    phoneNumber: "732.918.2600",
                    website: "https://fulfillnj.org/",
                    state: "New Jersey",
                    email: "info@fulfillnj.org",
                    coordinate: CLLocationCoordinate2D(latitude: 40.2239, longitude: -74.0485)
                ),
                FoodBank(
                    name: "Food Bank of South Jersey",
                    address: "1501 John Tipton Boulevard, Pennsauken, NJ 08110",
                    phoneNumber: "856.662.4884",
                    website: "https://foodbanksj.org/",
                    state: "New Jersey",
                    email: "info@foodbanksj.org",
                    coordinate: CLLocationCoordinate2D(latitude: 39.9765, longitude: -75.0727)
                ),
                FoodBank(
                    name: "Roadrunner Food Bank",
                    address: "5840 Office Blvd NE, Albuquerque, NM 87109",
                    phoneNumber: "505.247.2052",
                    website: "https://www.rrfb.org/",
                    state: "New Mexico",
                    email: "info@rrfb.org",
                    coordinate: CLLocationCoordinate2D(latitude: 35.1482, longitude: -106.5973)
                ),
                FoodBank(
                    name: "Three Square Food Bank",
                    address: "4190 N. Pecos Rd., Las Vegas, NV 89115",
                    phoneNumber: "702.644.3663",
                    website: "https://www.threesquare.org/",
                    state: "Nevada",
                    email: "info@threesquare.org",
                    coordinate: CLLocationCoordinate2D(latitude: 36.2354, longitude: -115.1002)
                ),
                FoodBank(
                    name: "Food Bank of Northern Nevada",
                    address: "550 Italy Dr, Sparks, NV 89437",
                    phoneNumber: "775.331.3663",
                    website: "https://fbnn.org/",
                    state: "Nevada",
                    email: "info@fbnn.org",
                    coordinate: CLLocationCoordinate2D(latitude: 39.5990, longitude: -119.7074)
                ),
                FoodBank(
                    name: "City Harvest",
                    address: "150 52nd Street, Brooklyn, NY 11232",
                    phoneNumber: "646.412.0600",
                    website: "https://www.cityharvest.org/",
                    state: "New York",
                    email: "info@cityharvest.org",
                    coordinate: CLLocationCoordinate2D(latitude: 40.6550, longitude: -74.0182)
                ),
                FoodBank(
                    name: "FeedMore Western New York, Inc.",
                    address: "91 Holt Street, Buffalo, NY 14206",
                    phoneNumber: "716.852.1305",
                    website: "https://www.feedmorewny.org/",
                    state: "New York",
                    email: "info@feedmorewny.org",
                    coordinate: CLLocationCoordinate2D(latitude: 42.8757, longitude: -78.8336)
                ),
                FoodBank(
                    name: "Food Bank of the Southern Tier",
                    address: "388 Upper Oakwood Avenue, Elmira, NY 14903",
                    phoneNumber: "607.796.6061",
                    website: "https://www.foodbankst.org/",
                    state: "New York",
                    email: "info@foodbankst.org",
                    coordinate: CLLocationCoordinate2D(latitude: 42.1211, longitude: -76.8375)
                ),
                FoodBank(
                    name: "Feeding Westchester",
                    address: "200 Clearbrook Road, Elmsford, NY 10523",
                    phoneNumber: "914.923.1100",
                    website: "https://feedingwestchester.org/",
                    state: "New York",
                    email: "info@feedingwestchester.org",
                    coordinate: CLLocationCoordinate2D(latitude: 41.0655, longitude: -73.8185)
                ),
                FoodBank(
                    name: "Long Island Cares, Inc.",
                    address: "10 Davids Drive, Hauppauge, NY 11788",
                    phoneNumber: "631.582.3663",
                    website: "https://www.licares.org/",
                    state: "New York",
                    email: "info@licares.org",
                    coordinate: CLLocationCoordinate2D(latitude: 40.8229, longitude: -73.2090)
                ),
                FoodBank(
                    name: "Regional Food Bank of Northeastern New York",
                    address: "965 Albany Shaker Rd., Latham, NY 12110",
                    phoneNumber: "518.786.3691",
                    website: "https://regionalfoodbank.net/",
                    state: "New York",
                    email: "info@regionalfoodbank.net",
                    coordinate: CLLocationCoordinate2D(latitude: 42.7465, longitude: -73.8166)
                ),
                FoodBank(
                    name: "Island Harvest",
                    address: "126 Spagnoli Road, Melville, NY 11747",
                    phoneNumber: "516.294.8528",
                    website: "https://www.islandharvest.org/",
                    state: "New York",
                    email: "info@islandharvest.org",
                    coordinate: CLLocationCoordinate2D(latitude: 40.7779, longitude: -73.4227)
                ),
                FoodBank(
                    name: "Food Bank For New York City",
                    address: "355 Food Center Dr., New York, NY 10474",
                    phoneNumber: "718.991.4300",
                    website: "https://www.foodbanknyc.org/",
                    state: "New York",
                    email: "info@foodbanknyc.org",
                    coordinate: CLLocationCoordinate2D(latitude: 40.8107, longitude: -73.8790)
                ),
                FoodBank(
                    name: "Foodlink, Inc.",
                    address: "2011 Mt. Read Blvd., Rochester, NY 14615",
                    phoneNumber: "585.328.3380",
                    website: "https://foodlinkny.org/",
                    state: "New York",
                    email: "info@foodlinkny.org",
                    coordinate: CLLocationCoordinate2D(latitude: 43.1808, longitude: -77.6555)
                ),
                FoodBank(
                    name: "Food Bank of Central New York",
                    address: "7066 Interstate Island Road, Syracuse, NY 13209",
                    phoneNumber: "315.437.1899",
                    website: "https://www.foodbankcny.org/",
                    state: "New York",
                    email: "info@foodbankcny.org",
                    coordinate: CLLocationCoordinate2D(latitude: 43.0914, longitude: -76.2178)
                ),
                FoodBank(
                    name: "Akron-Canton Regional Foodbank",
                    address: "350 Opportunity Parkway, Akron, OH 44307",
                    phoneNumber: "330.535.6900",
                    website: "https://www.akroncantonfoodbank.org/",
                    state: "Ohio",
                    email: "info@akroncantonfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 41.0732, longitude: -81.5377)
                ),
                FoodBank(
                    name: "Freestore Foodbank",
                    address: "3401 Rosenthal Way, Cincinnati, OH 45204",
                    phoneNumber: "513.482.4500",
                    website: "https://freestorefoodbank.org/",
                    state: "Ohio",
                    email: "info@freestorefoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 39.1026, longitude: -84.5577)
                ),
                FoodBank(
                    name: "Greater Cleveland Food Bank",
                    address: "13815 Coit Rd., Cleveland, OH 44110",
                    phoneNumber: "216.738.2265",
                    website: "https://www.greaterclevelandfoodbank.org/",
                    state: "Ohio",
                    email: "info@greaterclevelandfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 41.5487, longitude: -81.5691)
                ),
                FoodBank(
                    name: "The Foodbank, Inc.",
                    address: "56 Armor Place, Dayton, OH 45417",
                    phoneNumber: "937.461.0265",
                    website: "https://thefoodbankdayton.org/",
                    state: "Ohio",
                    email: "info@thefoodbankdayton.org",
                    coordinate: CLLocationCoordinate2D(latitude: 39.7490, longitude: -84.2174)
                ),
                FoodBank(
                    name: "Shared Harvest Foodbank",
                    address: "5901 Dixie Highway, Fairfield, OH 45014",
                    phoneNumber: "513.874.0114",
                    website: "https://www.sharedharvest.org/",
                    state: "Ohio",
                    email: "info@sharedharvest.org",
                    coordinate: CLLocationCoordinate2D(latitude: 39.3466, longitude: -84.5543)
                ),
                FoodBank(
                    name: "Mid-Ohio FoodBank",
                    address: "3960 Brookham Dr., Grove City, OH 43123",
                    phoneNumber: "614.277.3663",
                    website: "https://mofc.org/",
                    state: "Ohio",
                    email: "info@mofc.org",
                    coordinate: CLLocationCoordinate2D(latitude: 39.8820, longitude: -83.0726)
                ),
                FoodBank(
                    name: "West Ohio Food Bank",
                    address: "1380 East Kibby Street, Lima, OH 45804",
                    phoneNumber: "419.222.7946",
                    website: "https://www.westohiofoodbank.org/",
                    state: "Ohio",
                    email: "info@westohiofoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 40.7324, longitude: -84.0852)
                ),
                FoodBank(
                    name: "SE Ohio Foodbank",
                    address: "1005 CIC Drive, Logan, OH 43138",
                    phoneNumber: "740.385.6813",
                    website: "https://hapcap.org/seofb/",
                    state: "Ohio",
                    email: "info@hapcap.org",
                    coordinate: CLLocationCoordinate2D(latitude: 39.5432, longitude: -82.4105)
                ),
                FoodBank(
                    name: "Second Harvest Food Bank of North Central Ohio",
                    address: "5510 Baumhart Rd, Lorain, OH 44053",
                    phoneNumber: "440.960.2265",
                    website: "https://www.secondharvestfoodbank.org/",
                    state: "Ohio",
                    email: "info@secondharvestfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 41.4119, longitude: -82.2010)
                ),
                FoodBank(
                    name: "Second Harvest Food Bank of Clark, Champaign & Logan Counties",
                    address: "20 N Murray, Springfield, OH 45503",
                    phoneNumber: "937.323.6507",
                    website: "https://www.theshfb.org/",
                    state: "Ohio",
                    email: "info@theshfb.org",
                    coordinate: CLLocationCoordinate2D(latitude: 39.9294, longitude: -83.8121)
                ),
                FoodBank(
                    name: "Toledo Northwestern Ohio Food Bank",
                    address: "24 East Woodruff Avenue, Toledo, OH 43604",
                    phoneNumber: "419.242.5000",
                    website: "https://www.toledofoodbank.org/",
                    state: "Ohio",
                    email: "info@toledofoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 41.6687, longitude: -83.5416)
                ),
                FoodBank(
                    name: "Second Harvest Food Bank of the Mahoning Valley",
                    address: "2805 Salt Springs Road, Youngstown, OH 44509",
                    phoneNumber: "330.792.5522",
                    website: "https://www.mahoningvalleysecondharvest.org/",
                    state: "Ohio",
                    email: "info@mahoningvalleysecondharvest.org",
                    coordinate: CLLocationCoordinate2D(latitude: 41.1243, longitude: -80.6974)
                ),
                FoodBank(
                    name: "Regional Food Bank of Oklahoma",
                    address: "3355 S. Purdue, Oklahoma City, OK 73179",
                    phoneNumber: "405.972.1111",
                    website: "https://www.regionalfoodbank.org/",
                    state: "Oklahoma",
                    email: "info@regionalfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 35.4227, longitude: -97.6200)
                ),
                FoodBank(
                    name: "Food Bank of Eastern Oklahoma",
                    address: "1304 N. Kenosha Ave., Tulsa, OK 74106",
                    phoneNumber: "918.585.2800",
                    website: "https://www.okfoodbank.org/",
                    state: "Oklahoma",
                    email: "info@okfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 36.1722, longitude: -95.9822)
                ),
                FoodBank(
                    name: "Oregon Food Bank",
                    address: "7900 NE 33rd Drive, Portland, OR 97211",
                    phoneNumber: "503.282.0555",
                    website: "https://www.oregonfoodbank.org/",
                    state: "Oregon",
                    email: "info@oregonfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 45.5711, longitude: -122.6353)
                ),
                FoodBank(
                    name: "Westmoreland Food Bank",
                    address: "100 Devonshire Drive, Delmont, PA 15626",
                    phoneNumber: "724.468.8660",
                    website: "https://www.westmorelandfoodbank.org/",
                    state: "Pennsylvania",
                    email: "info@westmorelandfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 40.4044, longitude: -79.5705)
                ),
                FoodBank(
                    name: "Greater Pittsburgh Community Food Bank",
                    address: "1 North Linden Street, Duquesne, PA 15110",
                    phoneNumber: "412.460.3663",
                    website: "https://www.pittsburghfoodbank.org/",
                    state: "Pennsylvania",
                    email: "info@pittsburghfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 40.3780, longitude: -79.8613)
                ),
                FoodBank(
                    name: "Second Harvest Food Bank of Northwest Pennsylvania",
                    address: "1507 Grimm Drive, Erie, PA 16501",
                    phoneNumber: "814.459.3663",
                    website: "https://www.nwpafoodbank.org/",
                    state: "Pennsylvania",
                    email: "info@nwpafoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 42.1134, longitude: -80.0732)
                ),
                FoodBank(
                    name: "Central Pennsylvania Food Bank",
                    address: "3908 Corey Road, Harrisburg, PA 17109",
                    phoneNumber: "717.564.1700",
                    website: "https://www.centralpafoodbank.org/",
                    state: "Pennsylvania",
                    email: "info@centralpafoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 40.3061, longitude: -76.8447)
                ),
                FoodBank(
                    name: "Second Harvest Food Bank of Lehigh Valley and NE Pennsylvania",
                    address: "6969 Silver Crest Road, Nazareth, PA 18064",
                    phoneNumber: "610.434.0875",
                    website: "https://www.shfblv.org/",
                    state: "Pennsylvania",
                    email: "info@shfblv.org",
                    coordinate: CLLocationCoordinate2D(latitude: 40.7689, longitude: -75.3557)
                ),
                FoodBank(
                    name: "Philabundance",
                    address: "3616 S. Galloway Street, Philadelphia, PA 19148",
                    phoneNumber: "215.339.0900",
                    website: "https://www.philabundance.org/",
                    state: "Pennsylvania",
                    email: "info@philabundance.org",
                    coordinate: CLLocationCoordinate2D(latitude: 39.9144, longitude: -75.1565)
                ),
                FoodBank(
                    name: "H & J Weinberg Northeast Pennsylvania Regional Food Bank",
                    address: "185 Research Drive, Pittston, PA 18640",
                    phoneNumber: "570.826.0510",
                    website: "https://www.ceopeoplehelpingpeople.org/",
                    state: "Pennsylvania",
                    email: "info@ceopeoplehelpingpeople.org",
                    coordinate: CLLocationCoordinate2D(latitude: 41.3121, longitude: -75.7770)
                ),
                FoodBank(
                    name: "Helping Harvest",
                    address: "117 Morgan Drive, Reading, PA 19608",
                    phoneNumber: "610.926.5802",
                    website: "https://helpingharvest.org/",
                    state: "Pennsylvania",
                    email: "info@helpingharvest.org",
                    coordinate: CLLocationCoordinate2D(latitude: 40.3286, longitude: -76.0101)
                ),
                FoodBank(
                    name: "Mercer County Food Bank",
                    address: "109 S Sharpsville Avenue, STE A, Sharon, PA 16146",
                    phoneNumber: "724.981.0353",
                    website: "https://mercercountyfoodbank.org/",
                    state: "Pennsylvania",
                    email: "info@mercercountyfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 41.2323, longitude: -80.5102)
                ),
                FoodBank(
                    name: "Banco de Alimentos de Puerto Rico",
                    address: "Urbanization Country Club Park C / 272 IC4, PO Box 3990, Carolina, PR 00984",
                    phoneNumber: "787.740.3663",
                    website: "https://alimentospr.org/",
                    state: "Puerto Rico",
                    email: "info@alimentospr.org",
                    coordinate: CLLocationCoordinate2D(latitude: 18.3876, longitude: -65.9597)
                ),
                FoodBank(
                    name: "Rhode Island Community Food Bank",
                    address: "200 Niantic Ave., Providence, RI 02907",
                    phoneNumber: "401.942.6325",
                    website: "https://www.rifoodbank.org/",
                    state: "Rhode Island",
                    email: "info@rifoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 41.8024, longitude: -71.4444)
                ),
                FoodBank(
                    name: "Lowcountry Food Bank",
                    address: "2864 Azalea Drive, Charleston, SC 29405",
                    phoneNumber: "843.747.8146",
                    website: "https://www.lowcountryfoodbank.org/",
                    state: "South Carolina",
                    email: "info@lowcountryfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 32.8523, longitude: -79.9828)
                ),
                FoodBank(
                    name: "Harvest Hope Food Bank",
                    address: "2220 Shop Road, Columbia, SC 29201",
                    phoneNumber: "803.254.4432",
                    website: "https://www.harvesthope.org/",
                    state: "South Carolina",
                    email: "info@harvesthope.org",
                    coordinate: CLLocationCoordinate2D(latitude: 33.9727, longitude: -80.9989)
                ),
                FoodBank(
                    name: "Feeding South Dakota",
                    address: "4701 N Westport Ave, Sioux Falls, SD 57107",
                    phoneNumber: "605.335.0364",
                    website: "https://www.feedingsouthdakota.org/",
                    state: "South Dakota",
                    email: "info@feedingsouthdakota.org",
                    coordinate: CLLocationCoordinate2D(latitude: 43.5875, longitude: -96.7538)
                ),
                FoodBank(
                    name: "Food Bank of the Golden Crescent",
                    address: "801 South Laurent, P.O.Box 5085, Victoria, TX 77901",
                    phoneNumber: "361.578.0591",
                    website: "https://www.tfbgc.org/",
                    state: "Texas",
                    email: "info@tfbgc.org",
                    coordinate: CLLocationCoordinate2D(latitude: 28.7948, longitude: -96.9934)
                ),
                FoodBank(
                    name: "Wichita Falls Area Food Bank",
                    address: "1230 Midwestern Parkway, PO Box 623, Wichita Falls, TX 76307",
                    phoneNumber: "940.766.2322",
                    website: "https://www.wfafb.org/",
                    state: "Texas",
                    email: "info@wfafb.org",
                    coordinate: CLLocationCoordinate2D(latitude: 33.8715, longitude: -98.5210)
                ),
                FoodBank(
                    name: "Utah Food Bank",
                    address: "3150 South 900 West, Salt Lake City, UT 84119",
                    phoneNumber: "801.978.2452",
                    website: "https://www.utahfoodbank.org",
                    state: "Utah",
                    email: "info@utahfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 40.6995, longitude: -111.9190)
                ),
                FoodBank(
                    name: "Fredericksburg Regional Food Bank",
                    address: "3631 Lee Hill Drive, PO Box 1006, Fredericksburg, VA 22408",
                    phoneNumber: "540.371.7666",
                    website: "https://www.fredfood.org/",
                    state: "Virginia",
                    email: "info@fredfood.org",
                    coordinate: CLLocationCoordinate2D(latitude: 38.2600, longitude: -77.4762)
                ),
                FoodBank(
                    name: "Virginia Peninsula Foodbank",
                    address: "2401 Aluminum Avenue, Hampton, VA 23661",
                    phoneNumber: "757.596.7188",
                    website: "https://www.hrfoodbank.org/",
                    state: "Virginia",
                    email: "info@hrfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 37.0116, longitude: -76.3794)
                ),
                FoodBank(
                    name: "Foodbank of Southeastern Virginia and the Eastern Shore",
                    address: "800 Tidewater Drive, PO Box 1940, Norfolk, VA 23504",
                    phoneNumber: "757.627.6599",
                    website: "https://www.foodbankonline.org/",
                    state: "Virginia",
                    email: "info@foodbankonline.org",
                    coordinate: CLLocationCoordinate2D(latitude: 36.8561, longitude: -76.2791)
                ),
                FoodBank(
                    name: "Feed More",
                    address: "1415 Rhoadmiller Street, Richmond, VA 23220",
                    phoneNumber: "804.521.2500",
                    website: "https://www.feedmore.org/",
                    state: "Virginia",
                    email: "info@feedmore.org",
                    coordinate: CLLocationCoordinate2D(latitude: 37.5650, longitude: -77.4677)
                ),
                FoodBank(
                    name: "Feeding Southwest Virginia",
                    address: "1025 Electric Road, Salem, VA 24153",
                    phoneNumber: "540.342.3011",
                    website: "https://www.feedingswva.org/",
                    state: "Virginia",
                    email: "info@feedingswva.org",
                    coordinate: CLLocationCoordinate2D(latitude: 37.2857, longitude: -80.0562)
                ),
                FoodBank(
                    name: "Blue Ridge Area Food Bank",
                    address: "96 Laurel Hill Road, P.O. Box 937, Verona, VA 24482",
                    phoneNumber: "540.248.3663",
                    website: "https://www.brafb.org/",
                    state: "Virginia",
                    email: "info@brafb.org",
                    coordinate: CLLocationCoordinate2D(latitude: 38.2014, longitude: -79.0005)
                ),
                FoodBank(
                    name: "Vermont Foodbank",
                    address: "33 Parker Road, Barre, VT 05641",
                    phoneNumber: "802.476.3341",
                    website: "https://www.vtfoodbank.org/",
                    state: "Vermont",
                    email: "info@vtfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 44.2013, longitude: -72.5121)
                ),
                FoodBank(
                    name: "Food Lifeline",
                    address: "815 South 96th Street, Seattle, WA 98108",
                    phoneNumber: "206.545.6600",
                    website: "https://www.foodlifeline.org/",
                    state: "Washington",
                    email: "info@foodlifeline.org",
                    coordinate: CLLocationCoordinate2D(latitude: 47.5189, longitude: -122.3200)
                ),
                FoodBank(
                    name: "Second Harvest Inland Northwest",
                    address: "1234 E. Front Avenue, Spokane, WA 99202",
                    phoneNumber: "509.534.6678",
                    website: "https://www.2-harvest.org/",
                    state: "Washington",
                    email: "info@2-harvest.org",
                    coordinate: CLLocationCoordinate2D(latitude: 47.6604, longitude: -117.3947)
                ),
                FoodBank(
                    name: "Second Harvest Foodbank of Southern Wisconsin",
                    address: "2802 Dairy Drive, Madison, WI 53718",
                    phoneNumber: "608.223.9121",
                    website: "https://www.secondharvestsw.org/",
                    state: "Wisconsin",
                    email: "info@secondharvestsw.org",
                    coordinate: CLLocationCoordinate2D(latitude: 43.0535, longitude: -89.3057)
                ),
                FoodBank(
                    name: "Feeding America Eastern Wisconsin",
                    address: "1700 W. Fond Du Lac Avenue, Milwaukee, WI 53205",
                    phoneNumber: "414.931.7400",
                    website: "https://feedingamericawi.org/",
                    state: "Wisconsin",
                    email: "info@feedingamericawi.org",
                    coordinate: CLLocationCoordinate2D(latitude: 43.0677, longitude: -87.9412)
                ),
                FoodBank(
                    name: "Mountaineer Food Bank",
                    address: "484 Enterprise Drive, Gassaway, WV 26624",
                    phoneNumber: "304.364.5518",
                    website: "https://www.mountaineerfoodbank.org",
                    state: "West Virginia",
                    email: "info@mountaineerfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 38.6736, longitude: -80.7802)
                ),
                FoodBank(
                    name: "Facing Hunger Foodbank",
                    address: "1327 Seventh Avenue, Huntington, WV 25701",
                    phoneNumber: "304.523.6029",
                    website: "https://www.facinghunger.org/",
                    state: "West Virginia",
                    email: "info@facinghunger.org",
                    coordinate: CLLocationCoordinate2D(latitude: 38.4192, longitude: -82.4345)
                ),
                FoodBank(
                    name: "Central Texas Food Bank",
                    address: "6500 Metropolis Drive, Austin, TX 78744",
                    phoneNumber: "512.282.2111",
                    website: "https://www.centraltexasfoodbank.org/",
                    state: "Texas",
                    email: "info@centraltexasfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 30.2084, longitude: -97.7417)
                ),
                FoodBank(
                    name: "Channel One Regional Food Bank",
                    address: "131 35th St SE, Rochester, MN 55904",
                    phoneNumber: "507.424.1700",
                    website: "https://www.helpingfeedpeople.org/",
                    state: "Minnesota",
                    email: "info@helpingfeedpeople.org",
                    coordinate: CLLocationCoordinate2D(latitude: 44.0108, longitude: -92.4451)
                ),
                FoodBank(
                    name: "Chattanooga Area Food Bank",
                    address: "2009 Curtain Pole Rd, Chattanooga, TN 37406",
                    phoneNumber: "423.622.1800",
                    website: "https://www.chattfoodbank.org/",
                    state: "Tennessee",
                    email: "info@chattfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 35.0737, longitude: -85.2832)
                ),
                FoodBank(
                    name: "Coastal Bend Food Bank",
                    address: "826 Krill St, Corpus Christi, TX 78408",
                    phoneNumber: "361.887.6291",
                    website: "https://www.coastalbendfoodbank.org/",
                    state: "Texas",
                    email: "info@coastalbendfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 27.8073, longitude: -97.4377)
                ),
                FoodBank(
                    name: "East Texas Food Bank",
                    address: "3201 Robertson Rd, Tyler, TX 75701",
                    phoneNumber: "903.597.3663",
                    website: "https://www.easttexasfoodbank.org/",
                    state: "Texas",
                    email: "info@easttexasfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 32.3287, longitude: -95.3251)
                ),
                FoodBank(
                    name: "El Pasoans Fighting Hunger",
                    address: "9541 Plaza Cir, El Paso, TX 79927",
                    phoneNumber: "915.298.0353",
                    website: "https://www.elpasoansfightinghunger.org/",
                    state: "Texas",
                    email: "info@elpasoansfightinghunger.org",
                    coordinate: CLLocationCoordinate2D(latitude: 31.6997, longitude: -106.3124)
                ),
                FoodBank(
                    name: "Feeding America Headquarters",
                    address: "161 North Clark Street, Chicago, IL 60601",
                    phoneNumber: "800.771.2303",
                    website: "https://www.feedingamerica.org/",
                    state: "Illinois",
                    email: "info@feedingamerica.org",
                    coordinate: CLLocationCoordinate2D(latitude: 41.8854, longitude: -87.6303)
                ),
                FoodBank(
                    name: "Feeding America Riverside and San Bernardino Counties",
                    address: "2950-A Jefferson St, Riverside, CA 92504",
                    phoneNumber: "951.359.4757",
                    website: "https://www.feedingamericaie.org/",
                    state: "California",
                    email: "info@feedingamericaie.org",
                    coordinate: CLLocationCoordinate2D(latitude: 33.9468, longitude: -117.4091)
                ),
                FoodBank(
                    name: "Feeding America, Kentucky's Heartland",
                    address: "313 Peterson Dr, Elizabethtown, KY 42701",
                    phoneNumber: "270.769.6997",
                    website: "https://feedingamericaky.org/",
                    state: "Kentucky",
                    email: "info@feedingamericaky.org",
                    coordinate: CLLocationCoordinate2D(latitude: 37.6940, longitude: -85.8804)
                ),
                FoodBank(
                    name: "Feeding San Diego",
                    address: "9477 Waples St, Suite 100, San Diego, CA 92121",
                    phoneNumber: "858.452.3663",
                    website: "https://feedingsandiego.org/",
                    state: "California",
                    email: "info@feedingsandiego.org",
                    coordinate: CLLocationCoordinate2D(latitude: 32.8941, longitude: -117.1734)
                ),
                FoodBank(
                    name: "Food Bank of Central and Eastern North Carolina",
                    address: "1924 Capital Blvd, Raleigh, NC 27604",
                    phoneNumber: "919.875.0707",
                    website: "https://foodbankcenc.org/",
                    state: "North Carolina",
                    email: "info@foodbankcenc.org",
                    coordinate: CLLocationCoordinate2D(latitude: 35.7991, longitude: -78.6335)
                ),
                FoodBank(
                    name: "Food Bank of Eastern Michigan",
                    address: "2300 Lapeer Road, Flint, MI 48503",
                    phoneNumber: "810.239.4441",
                    website: "https://www.fbem.org/",
                    state: "Michigan",
                    email: "info@fbem.org",
                    coordinate: CLLocationCoordinate2D(latitude: 43.0011, longitude: -83.6733)
                ),
                FoodBank(
                    name: "Food Bank of the Rio Grande Valley",
                    address: "724 N Cage Blvd, Pharr, TX 78577",
                    phoneNumber: "956.682.8101",
                    website: "https://www.foodbankrgv.com/",
                    state: "Texas",
                    email: "info@foodbankrgv.com",
                    coordinate: CLLocationCoordinate2D(latitude: 26.2025, longitude: -98.1831)
                ),
                FoodBank(
                    name: "Food Bank of West Central Texas",
                    address: "5505 N 1st St, Abilene, TX 79603",
                    phoneNumber: "325.695.6311",
                    website: "https://www.fbwct.org/",
                    state: "Texas",
                    email: "info@fbwct.org",
                    coordinate: CLLocationCoordinate2D(latitude: 32.4735, longitude: -99.7862)
                ),
                FoodBank(
                    name: "Forgotten Harvest",
                    address: "21800 Greenfield Rd, Oak Park, MI 48237",
                    phoneNumber: "248.967.1500",
                    website: "https://www.forgottenharvest.org/",
                    state: "Michigan",
                    email: "info@forgottenharvest.org",
                    coordinate: CLLocationCoordinate2D(latitude: 42.4558, longitude: -83.2025)
                ),
                FoodBank(
                    name: "Gleaners Community Food Bank of Southeastern Michigan",
                    address: "2131 Beaufait St, Detroit, MI 48207",
                    phoneNumber: "313.923.3535",
                    website: "https://www.gcfb.org/",
                    state: "Michigan",
                    email: "info@gcfb.org",
                    coordinate: CLLocationCoordinate2D(latitude: 42.3708, longitude: -83.0153)
                ),
                FoodBank(
                    name: "God's Pantry Food Bank, Inc.",
                    address: "1685 Jaggie Fox Way, Lexington, KY 40511",
                    phoneNumber: "859.255.6592",
                    website: "https://godspantry.org/",
                    state: "Kentucky",
                    email: "info@godspantry.org",
                    coordinate: CLLocationCoordinate2D(latitude: 38.0744, longitude: -84.5332)
                ),
                FoodBank(
                    name: "H and J Weinberg Northeast Pennsylvania Regional Food Bank",
                    address: "185 Research Drive, Pittston, PA 18640",
                    phoneNumber: "570.826.0510",
                    website: "https://www.ceopeoplehelpingpeople.org/",
                    state: "Pennsylvania",
                    email: "info@ceopeoplehelpingpeople.org",
                    coordinate: CLLocationCoordinate2D(latitude: 41.3260, longitude: -75.7383)
                ),
                FoodBank(
                    name: "High Plains Food Bank",
                    address: "815 Ross St, Amarillo, TX 79102",
                    phoneNumber: "806.374.8562",
                    website: "https://www.hpfb.org/",
                    state: "Texas",
                    email: "info@hpfb.org",
                    coordinate: CLLocationCoordinate2D(latitude: 35.2040, longitude: -101.8423)
                ),
                FoodBank(
                    name: "Houston Food Bank",
                    address: "535 Portwall St, Houston, TX 77029",
                    phoneNumber: "713.223.3700",
                    website: "https://www.houstonfoodbank.org/",
                    state: "Texas",
                    email: "info@houstonfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 29.7719, longitude: -95.2906)
                ),
                FoodBank(
                    name: "Mid-South Food Bank",
                    address: "3865 S Perkins Rd, Memphis, TN 38118",
                    phoneNumber: "901.527.0841",
                    website: "https://www.midsouthfoodbank.org/",
                    state: "Tennessee",
                    email: "info@midsouthfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 35.0515, longitude: -89.9025)
                ),
                FoodBank(
                    name: "North Country Food Bank, Inc.",
                    address: "424 N Broadway, Crookston, MN 56716",
                    phoneNumber: "218.281.7356",
                    website: "https://www.northcountryfoodbank.org/",
                    state: "Minnesota",
                    email: "info@northcountryfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 47.7747, longitude: -96.6072)
                ),
                FoodBank(
                    name: "North Texas Food Bank",
                    address: "3677 Mapleshade Ln, Plano, TX 75075",
                    phoneNumber: "214.330.1396",
                    website: "https://www.ntfb.org/",
                    state: "Texas",
                    email: "info@ntfb.org",
                    coordinate: CLLocationCoordinate2D(latitude: 33.0198, longitude: -96.7513)
                ),
                FoodBank(
                    name: "San Antonio Food Bank",
                    address: "5200 Enrique M. Barrera Pkwy, San Antonio, TX 78227",
                    phoneNumber: "210.337.3663",
                    website: "https://www.safoodbank.org/",
                    state: "Texas",
                    email: "info@safoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 29.4269, longitude: -98.5969)
                ),
                FoodBank(
                    name: "Second Harvest Food Bank of East Tennessee",
                    address: "136 Harvest Ln, Maryville, TN 37801",
                    phoneNumber: "865.521.0000",
                    website: "https://www.secondharvestetn.org/",
                    state: "Tennessee",
                    email: "info@secondharvestetn.org",
                    coordinate: CLLocationCoordinate2D(latitude: 35.7556, longitude: -83.9727)
                ),
                FoodBank(
                    name: "Second Harvest Food Bank of Middle Tennessee",
                    address: "331 Great Circle Rd, Nashville, TN 37228",
                    phoneNumber: "615.329.3491",
                    website: "https://www.secondharvestmidtn.org/",
                    state: "Tennessee",
                    email: "info@secondharvestmidtn.org",
                    coordinate: CLLocationCoordinate2D(latitude: 36.1961, longitude: -86.8129)
                ),
                FoodBank(
                    name: "Second Harvest Food Bank of Northeast Tennessee",
                    address: "1020 Jericho Dr, Kingsport, TN 37663",
                    phoneNumber: "423.279.0430",
                    website: "https://www.netfoodbank.org/",
                    state: "Tennessee",
                    email: "info@netfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 36.4831, longitude: -82.4875)
                ),
                FoodBank(
                    name: "Second Harvest Heartland",
                    address: "1140 Gervais Ave, St. Paul, MN 55109",
                    phoneNumber: "651.484.5117",
                    website: "https://www.2harvest.org/",
                    state: "Minnesota",
                    email: "info@2harvest.org",
                    coordinate: CLLocationCoordinate2D(latitude: 45.0051, longitude: -93.0596)
                ),
                FoodBank(
                    name: "Second Harvest Northland",
                    address: "4503 Airpark Blvd, Duluth, MN 55811",
                    phoneNumber: "218.727.5653",
                    website: "https://www.northcountryfoodbank.org/",
                    state: "Minnesota",
                    email: "info@northcountryfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 46.8425, longitude: -92.1962)
                ),
                FoodBank(
                    name: "South Plains Food Bank",
                    address: "5605 MLK Blvd, Lubbock, TX 79404",
                    phoneNumber: "806.763.3003",
                    website: "https://www.spfb.org/",
                    state: "Texas",
                    email: "info@spfb.org",
                    coordinate: CLLocationCoordinate2D(latitude: 33.5611, longitude: -101.8375)
                ),
                FoodBank(
                    name: "South Texas Food Bank",
                    address: "1907 Freight St, Laredo, TX 78041",
                    phoneNumber: "956.726.3120",
                    website: "https://www.southtexasfoodbank.org/",
                    state: "Texas",
                    email: "info@southtexasfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 27.5297, longitude: -99.5055)
                ),
                FoodBank(
                    name: "Southeast Texas Food Bank",
                    address: "3845 S Martin Luther King Jr Pkwy, Beaumont, TX 77705",
                    phoneNumber: "409.839.8777",
                    website: "https://setxfoodbank.org/",
                    state: "Texas",
                    email: "info@setxfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 30.0499, longitude: -94.1181)
                ),
                FoodBank(
                    name: "Tarrant Area Food Bank",
                    address: "2524 Cullen St, Fort Worth, TX 76107",
                    phoneNumber: "817.857.7100",
                    website: "https://tafb.org/",
                    state: "Texas",
                    email: "info@tafb.org",
                    coordinate: CLLocationCoordinate2D(latitude: 32.7414, longitude: -97.3554)
                ),
                FoodBank(
                    name: "West Texas Food Bank",
                    address: "411 S Pagewood Ave, Odessa, TX 79761",
                    phoneNumber: "432.580.6333",
                    website: "https://wtxfoodbank.org/",
                    state: "Texas",
                    email: "info@wtxfoodbank.org",
                    coordinate: CLLocationCoordinate2D(latitude: 31.8348, longitude: -102.3781)
                )

        ]
    }
}

