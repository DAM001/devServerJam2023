moveSpeed = 3;
isMoving = false;

function Movement(moveDirection, speedModifier){
	speed = moveSpeed = speedModifier;
	direction = moveDirection;
	isMoving = speedModifier > 0;
}

function IsMoving(){
	return isMoving;
}