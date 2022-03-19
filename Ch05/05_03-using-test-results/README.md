# 05_03 Using test results to stop a build
Failures in the test stage will stop any stages that follow.  This prevents bugs from being deployed and prompts developers to resolve problems before they reach a production environment.

## Injecting a test failure
This lessons uses the same code as [05_02 Publish test results and code coverage reports](../05_02-publish-reports/README.md).

However, the file [test_app.py](./test_app.py) has been updated to include a test that will always fail.
```Python
def test_ALWAYS_FAIL(self):
    '''test_ALWAYS_FAIL: this test will always fail'''
    assert False
```

This will allow the project pipeline to run and encounter an error in the Test stage.

When Jenkins observes the failure in the Test stage, the Build and Deploy stages will be skipped.

*For more details on the requirements for running this project, please review [05_02 Publish test results and code coverage reports](../05_02-publish-reports/README.md).*
