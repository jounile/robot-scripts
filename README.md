# robot-scripts
Repository for Robot Framework end-to-end acceptance test scripts

Please see here to install Robot Framework on your local machine:

https://code.google.com/p/robotframework/wiki/Installation

1. Navigate to your local Git repository named "robot-scripts"

2. To run all tests in the suite use command:

  ```bash
  $ pybot --outputdir build src
  ```

3. To run only a particular test use command:

  ```bash
  $ pybot --test "Login to Qlma client" --outputdir build src
  ```
