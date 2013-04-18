function findMatchingClasses(searchQuery,data,keyList) {

	var options = { keys: keyList, threshold: '0.25' }
	var f = new Fuse(data,options);
	return f.search(searchQuery);

}

// format a raw array of classes
// output format: { EECS394-0: [ <class1>, <class2>, … ], … }
// each class contains a field "sections", which is an array of all sections for that class
function mergeClasses(classList,maxCount) {

	console.log(classList);

	/* todo: handle deferred sections at the end */

	function findLECforDIS(dis_id,list) {
		best_match = [-1,null];
		for (var i in list) {
			lec_id = list[i].section;
			if (lec_id < dis_id && lec_id > best_match[0]) {
				best_match = [lec_id,list[i]];
			}
		}
		return best_match[1];
	}
	
	var merged = {};
	var deferredSections = [];
	var count = 0;
	
	for (var i in classList) {
		if (maxCount!= -1 && count >= maxCount) {
			return merged;
		}
		curClass = classList[i];
		curClass['onoff'] = false;
		// this ID is unique for each class, eg. "EECS 211", and the same for all sections of that class
		classID = curClass.subject + curClass.number;
		if (merged[classID] === undefined) {
			// if curClass is the lecture, add it
			if (curClass.lecdisc == "LEC") {
				merged[classID] = new Array();
				curClass.onoff = true;
                merged[classID].push(curClass);
                count++;
			} else { // else, defer processing it for later
				deferredSections.push(curClass);
			}
		} else {
			if (curClass.lecdisc == "LEC") {
				merged[classID].push(curClass);
				count++;
			} else { //class is not LEC
				// find LEC with the next-lowest ID (eg. DIS 54 should be assigned to LEC 50, not LEC 40)
				var lecID = findLECforDIS(curClass.section,merged[classID]);
				if (lecID !== null) {
					lecID = lecID.unique_id;
                	//console.log(lecID);
                	//console.log(merged);
                	for (var n in merged[classID]) {
                    	if (merged[classID][n].unique_id == lecID) {
                        	if (merged[classID][n].sections === undefined) {
                            	merged[classID][n]['sections'] = new Array();
                            	curClass.onoff = true;
                            	console.log("ONOFF = TRUE");
                            	// todo: why isn't this section showing up when we makeCalendar???
                        	}
                        	merged[classID][n].sections.push(curClass);
                    	}
                	}
                }
			}
		}
	}
	return merged;
}