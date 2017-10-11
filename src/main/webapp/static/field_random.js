function statusGame() {

	var gameId = document.getElementById("gameId").value;
	var userId = document.getElementById("current_user").value;
	// var enemyId = document.getElementById("enemyId").value;
	var timerId = setInterval(function() {
		const
		xhr = new XMLHttpRequest();
		xhr.open('GET',
		'CheckGameStatusController?gameId=' + gameId + '&userId=' + userId);
		xhr.send();
		var listGame = document.getElementById("content");
		xhr.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				// alert(xhr.responseText.trim());
				switch (xhr.responseText.trim()) {
				case "YES":
					//listGame.innerHTML = "YES" + listGame.innerHTML;					
					unlockBattleFieldAndWait();
					break;
				case "NO":
					//listGame.innerHTML = "NO" + listGame.innerHTML;
					lockBattleFieldAndWait();
					break;
				case "END":
					var lock = document.getElementById("lockBlock");
					var text = lock.getElementsByTagName("h1")[0];
					lockBattleFieldAndWait();
					text.innerHTML = "END";
					break;

				default:
					lockBattleFieldAndWait();
					break;
				}

			} else {
				// listGame.style.color = "red";
				// listGame.innerHTML = "NO" + listGame.innerHTML;
			}
		}
	}, 200);
}

function lockBattleFieldAndWait() {
	var lock = document.getElementById("lockBlock");
	console.log("lockBlock");
	lockBlock.style.display = 'block';
}

function unlockBattleFieldAndWait() {
	var lock = document.getElementById("lockBlock");
	console.log("lockBlock");
	lockBlock.style.display = 'none';
}

function fire(point) {
	const
	xhr = new XMLHttpRequest();
	var gameId = document.getElementById("gameId").value;
	var current_userId = document.getElementById("current_user").value;

	xhr.open('POST', 'FireController?action=FIRE&point=' + point.value
			+ "&gameId=" + gameId + "&userId=" + current_userId);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			var result = xhr.responseText;
			console.log("xhr.responseText : " + result);
			switch (result.trim()) {
			case "KILLED":
				point.className += " " + xhr.responseText;
				point.disabled = true;
				console.log("kill");
				break;
			case "EMPTY":
				point.className += " " + xhr.responseText;
				lockBattleFieldAndWait();
				console.log("empty");
				break;
			default:
				console.log("default");
				document.getElementById("panel_enemy").innerHTML = xhr.responseText;
				break;
			}
		} else {
		}
	}
}

function addListener() {
	var checkbox = document
			.querySelectorAll("input[type=checkbox].field-position");
	checkbox.forEach(function(element) {
		element.addEventListener('change', function() {
			if (this.checked) {
				fire(this);
			}
		});
	});
}

function statusEnymyFieldFill() {
	var gameId = document.getElementById("gameId").value;
	var enemyId = document.getElementById("enemyId").value;
	var timerId = setInterval(function() {
		const
		xhr = new XMLHttpRequest();
		xhr.open('GET',
		// 'CheckFillFieldsOfEnemyController?action=CHECKING_FILL_FIELDS_ENEMY&gameId='+gameId+'&enemyId='+enemyId
		'CheckFillFieldsOfEnemyController?gameId=' + gameId + '&enemyId='
				+ enemyId + '');
		xhr.send();
		var listGame = document.getElementById("content");
		xhr.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				if (xhr.responseText == "YES") {
					//listGame.innerHTML = "YES" + listGame.innerHTML;
					// window.location = "BattleController?game=" + gameId;
					window.location = "CommandController?action=PLAY&game="
							+ gameId;

				} else {
					//listGame.innerHTML = "NO" + listGame.innerHTML;
				}
			} else {
				// listGame.style.color = "red";
				// listGame.innerHTML = "NO" + listGame.innerHTML;
			}
		}
	}, 5000);
}

function fillFieldRandom(countRandomPosition) {
	clearAll();
	var checkboxes = document
			.querySelectorAll("input[type=checkbox].field-position");
	var currentCheckCount = 0;
	while (countRandomPosition > currentCheckCount) {
		var i = Math.floor(Math.random(checkboxes.length)
				* (checkboxes.length - 0));
		console.log(i);
		checkboxes[i].checked = true;
		currentCheckCount++;
	}
}

function clearAll() {
	var listGame = document
			.querySelectorAll("input[type=checkbox].field-position");
	listGame.forEach(function(element) {
		element.checked = false;
		console.log(element);
	});
}

function showNewOffers() {

	var timerId = setInterval(function() {
		const
		xhr = new XMLHttpRequest();
		xhr.open('POST', 'CommandController');
		xhr.send();
		var listGame = document.getElementById("list-players");
		xhr.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				listGame.style.color = "green";
				//listGame.innerHTML = "1" + listGame.innerHTML;
			} else {
				listGame.style.color = "red";
			}
		}
	}, 3000);
}

/*
 * function onLoadWaitEnemy() {
 * 
 * var timerId = setInterval(function() { const xhr = new XMLHttpRequest();
 * xhr.open('POST', 'CommandController'); xhr.send(); var listGame =
 * document.getElementById("list-players"); xhr.onreadystatechange = function() {
 * if (this.readyState == 4 && this.status == 200) { listGame.style.color =
 * "green"; listGame.innerHTML = "1" + listGame.innerHTML; } else {
 * listGame.style.color = "red"; } } }, 3000); }
 */

function activateCheckboxes() {
	var listGame = document
			.querySelectorAll("input[type=checkbox].field-position");
	listGame.forEach(function(element) {
		element.disabled = false;
		console.log(element);
	});
}
function inactivateCheckboxes() {
	var listGame = document
			.querySelectorAll("input[type=checkbox].field-position");
	listGame.forEach(function(element) {
		element.disabled = true;
		console.log(element);
	});
}