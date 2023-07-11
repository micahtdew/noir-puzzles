use dep::std;

// Given a 4x4 sudoku board with array signal input "question" and "solution", check if the solution is correct.

//     "question" is a 16 length array. Example: [0,4,0,0,0,0,1,0,0,0,0,3,2,0,0,0] == [0, 4, 0, 0]
//                                                                                    [0, 0, 1, 0]
//                                                                                    [0, 0, 0, 3]
//                                                                                    [2, 0, 0, 0]

//     "solution" is a 16 length array. Example: [1,4,3,2,3,2,1,4,4,1,2,3,2,3,4,1] == [1, 4, 3, 2]
//                                                                                    [3, 2, 1, 4]
//                                                                                    [4, 1, 2, 3]
//                                                                                    [2, 3, 4, 1]

fn main(question: pub [Field; 16], answer : [Field; 16]) -> pub bool{
       
    // Verifying the Question
    for i in 0..16 {
        let mut a = question[i] == answer[i];
        let mut b = question[i] == 0;
        let c = a | b;
        std::println(c);
        assert(c == true);
    }

// Check first row has 3 inputs as 0 and 1 input as non zero
    let mut m:[Field; 16] = [0; 16];
    for i in 0..4 {
    let mut a = question[i] ;
    assert(a == question[i]);
    let mut b = 0;
    assert(b == 0);
    let c =  a==b; 
    m[i] = c as Field;
    }
    assert(3 == (m[0] + m[1] +m[2] + m[3]));

// Check second row has 3 inputs as 0 and 1 input as non zero

    for i in 4..8 {
    let mut a = question[i] ;
    assert(a == question[i]);
    let mut b = 0;
    assert(b == 0);
    let c =  a==b; 
    m[i] = c as Field;
    }
    assert(3 == (m[4] + m[5] +m[6] + m[7]));

// Check third row has 3 inputs as 0 and 1 input as non zero

    for i in 8..12 {
    let mut a = question[i] ;
    assert(a == question[i]);
    let mut b = 0;
    assert(b == 0);
    let c =  a==b; 
    m[i] = c as Field;
    }
    assert(3 == (m[8] + m[9] +m[10] + m[11]));

// Check fourth row has 3 inputs as 0 and 1 input as non zero

    for i in 12..16 {
    let mut a = question[i] ;
    assert(a == question[i]);
    let mut b = 0;
    assert(b == 0);
    let c =  a==b; 
    m[i] = c as Field;
    }
    assert(3 == (m[12] + m[13] +m[14] + m[15]));    

    // Solution Starts Here ..
    let mut check_array: [u64; 8] = [0; 8];
    for i in 0..4 {
        check_array[0] += answer[i] as u64;
        check_array[4] += answer[i * 4] as u64;
        check_array[5] += answer[(i * 4) + 1] as u64;
        check_array[6] += answer[(i * 4) + 2] as u64;
        check_array[7] += answer[(i * 4) + 3] as u64;
    }
    for i in 4..8 {
        check_array[1] += answer[i] as u64;
    }
    for i in 8..12 {
        check_array[2] += answer[i] as u64;
    }
    for i in 12..16 {
        check_array[3] += answer[i] as u64;
    }
    let mut erros : Field = 
    for i in 0..8 {
        assert(check_array[i] == 10);
        if check_array[i] != 10 {
            false
        }
    }
    true
}

