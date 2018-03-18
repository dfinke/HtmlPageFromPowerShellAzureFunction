$requestBody = Get-Content $req -Raw | ConvertFrom-Json
$city = $requestBody.city

if (!$city -and !$req_query_city) {
    [PSCustomObject]@{
        'Status' = 400
        'Body'   = "Please pass a city on the query string or in the request body"
    } | ConvertTo-Json > $res

    return
}

$city = $req_query_city
switch ($city) {
    "austin" {
        $result = "$($city): Clothing: Jeans, shorts, t-shirts. Shoes: Boots, sandals, and sneakers. Accessories: Sunglasses, sunscreen"
    }

    "san francisco" {
        $result = "Clothing: Jeans, t-shirts, warm windproof layer. Shoes: Comfortable shoes, sneakers. Accessories: Sunglasses, sunscreen"
    }

    "los angeles" {
        $result = "Clothing: Jeans, t-shirts, sweatshirt, light jacket. Shoes: Flat shoes, sandals, sneakers. Accessories: Long scarves, hat"
    }
    "new york" {
        $result = "Clothing: Jeans, t-shirts, shirts, sweater. Shoes: Comfortable shoes, sneakers. Accessories: Scarf, beanie hat, gloves"
    }
}

"$($city): $($result)" > $res

# module.exports = function (context, req) {
#     context.log('JavaScript HTTP trigger function processed a request.');

#     if (req.query.city || (req.body && req.body.city)) {
#         let city
#         let result
#         if(req.query.city){
#             city = req.query.city
#         } else {
#             city = req.body.city
#         }

#         switch(city.toLowerCase()) {
#             case "austin":
#                 result = city + ": " + "Clothing: Jeans, shorts, t-shirts. Shoes: Boots, sandals, and sneakers. Accessories: Sunglasses, sunscreen"
#                 break;
#             case "san francisco":
#                 result = city + ": " + "Clothing: Jeans, t-shirts, warm windproof layer. Shoes: Comfortable shoes, sneakers. Accessories: Sunglasses, sunscreen"
#                 break;
#             case "los angeles":
#                 result = city + ": " + "Clothing: Jeans, t-shirts, sweatshirt, light jacket. Shoes: Flat shoes, sandals, sneakers. Accessories: Long scarves, hat"
#                 break;
#             case "new york":
#                 result = city + ": " + "Clothing: Jeans, t-shirts, shirts, sweater. Shoes: Comfortable shoes, sneakers. Accessories: Scarf, beanie hat, gloves"
#                 break;
#             default:
#                 result = "We dont't have any data for " + city
#         }

#         context.res = {
#             // status: 200, /* Defaults to 200 */
#             body: result
#         };
#     }
#     else {
#         context.res = {
#             status: 400,
#             body: "Please pass a city on the query string or in the request body"
#         };
#     }
#     context.done();
# };