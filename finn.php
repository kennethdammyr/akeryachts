<?php

/********************************************************************
 *
 * Simple api-client demo for "Boliger til salgs" search
 *
 * This demo aims to get you started, it comes with absolutely NO GUARANTEE!
 * As an API-client you are responsible your client-side code
 *
 ********************************************************************/
header('Content-Type: text/html; charset=utf-8');

//parse client.ini
$clientIniArray = parse_ini_file("config/client.ini");
$apiKey = $clientIniArray['apiKey'];
$orgId = $clientIniArray['orgId'];
$userAgent = $clientIniArray['userAgent'];


// Main output-variable
$boats = array();

// Initial API-URL

$apiUrl = "https://cache.api.finn.no/iad/search/boat-sale?orgId=400970272&rows=".$_GET["rows"]."&page=".$_GET["page"];

// Fetch initial data 
$ch = curl_init();
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_USERAGENT, $userAgent);
curl_setopt($ch, CURLOPT_FRESH_CONNECT, 1);
curl_setopt($ch, CURLOPT_URL, utf8_decode($apiUrl));
curl_setopt($ch, CURLOPT_HTTPHEADER, array("x-finn-apikey: $apiKey"));
$rawData = curl_exec($ch);
if (curl_error($ch)) {
    die("Fetch problem");
}
curl_close($ch);

//parse the xml and get namespaces (needed later to extract attributes and values)
$xmlData = new SimpleXMLElement($rawData);
$ns = $xmlData->getNamespaces(true);

//search data:
$searchTitle = $xmlData->title;
$searchSubTitle = $xmlData->subtitle;
$searchTotalResults = $xmlData->children($ns['os'])->totalResults;

//navigation links
$links = array();
foreach ($xmlData->link as $link) {
    $rel = $link->attributes()->rel;
    $ref = $link->attributes()->href;
    $links["$rel"] = "$ref";
	
}

//debug
/*
echo "
Search title    => $searchTitle
Search subtitle => $searchSubTitle
Search results  => $searchTotalResults
Self link:      => " . $links['self'] . "
First link:     => " . $links['first'] . "
Last link:      => " . $links['last'] . "
Next page:      => " . $links['next'] . "
Seach descr.:   => " . $links['search'] . "
";
*/

$entries = array();
foreach ($xmlData->entry as $entry) {
    array_push($entries, $entry);
}

foreach ($entries as $entry) {
	$boat = array();
	
	// Get some data
	$location = $entry->children($ns['finn'])->location;
	$city = $location->children($ns['finn'])->city;
	$title = $entry->title;
	
	// Get URLs
	foreach ($entry->link as $link){
		if($link->attributes()->rel == "self"){
			$entryURL = $link->attributes()->href;
		} else if ($link->attributes()->rel == "alternate"){
			$altURL = $link->attributes()->href;
		}
	}
	
	
	
	$boat['altURL']	= (string) $altURL;
	$boat['apiURL']	= (string) $entryURL;
	$boat['title']	= (string) $title;
	$boat['city']	= (string) $city;
	
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_USERAGENT, $userAgent);
	curl_setopt($ch, CURLOPT_FRESH_CONNECT, 1);
	curl_setopt($ch, CURLOPT_URL, utf8_decode($entryURL));
	curl_setopt($ch, CURLOPT_HTTPHEADER, array("x-finn-apikey: $apiKey"));
	$rawData = curl_exec($ch);
	if (curl_error($ch)) {
		die("Fetch problem");
	}
	
	curl_close($ch);
	
	$xmlData = new SimpleXMLElement($rawData);
	$ns = $xmlData->getNamespaces(true);
	$entry_adata = $xmlData->children($ns['finn'])->adata;
	$images = $xmlData->children($ns['media'])->content;
	
	// Get images
	$boat['images'] = array();
	foreach($images as $image){
		$imgurl = (string)  $image->attributes()->url;
		array_push($boat['images'], $imgurl);
	}
	
	//print_r($entry_adata);
	$contact = $xmlData->children($ns['finn'])->contact;
	
	foreach($contact->children() as $contact){
		$key = (string) $contact->getName();
		$boat[$key] = (string) $contact;	
	}
	
	// Get more data
	foreach($entry_adata->field as $field){

		if($field->attributes()->value) {
			$fieldname = (string) $field->attributes()->name;
			$boat[$fieldname] = (string) $field->attributes()->value; 
			//echo $field->attributes()->name.": ".$field->attributes()->value."\n";
		} else {
			//echo $field;
			switch($field->attributes()->name){
				
				case "description":
					$boat['description'] = (string) $field;
					break;
				case "equipment":
					$boat['equipment'] = (string) $field;
					break;
				case "motor":
					$boat['motor'] = "To much info...";
					break;
			}
			
		}
	}
	
	// Get price
	$price = $entry_adata->price->attributes()->value;
	$boat['price'] = (string) $price;
	
	array_push($boats, $boat);
}

// Final Output
echo json_encode($boats);
?>