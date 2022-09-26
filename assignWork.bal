
public function main() {
    int[] cubicleRequest = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97];

    int[] _ = allocateCubicles(cubicleRequest);

}

function allocateCubicles(int[] requests) returns int[] {
    int employeeCount = requests.length();
    //assigned
    int[] assignedCubicles = [];
    //rejected
    int[] rejectedCubicles = [];

    //check if employee count is between 0 and 97 and assign cubicles if available, if not available, reject request
    if (employeeCount >= 0 && employeeCount <= 97) {
        //check if cubicle is available
        foreach int request in requests {
            if (request >= 1 && request <= 65) {
                assignedCubicles.push(request);
            } else {
                //cubicle is not available
                //reject request
                rejectedCubicles.push(request);
            }
        }
    } else {
        //employee count is not between 0 and 97
        //reject all requests
        rejectedCubicles = requests;
    }

    // sort assigned cubicles in ascending order and return
    return sortCubicles(assignedCubicles);

}

public function sortCubicles(int[] cubicles) returns int[] {

    int temp = 0;
    int[] sortedCubicles = cubicles;
    int n = sortedCubicles.length();

    foreach int i in 0 ... n {
        foreach int j in 0 ... n {
            if (sortedCubicles[i] < sortedCubicles[j]) {
                temp = sortedCubicles[i];
                sortedCubicles[i] = sortedCubicles[j];
                sortedCubicles[j] = temp;
            }
        }
    }

    return sortedCubicles;

}
