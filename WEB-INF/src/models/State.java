package models;

public class State {

  ///////////properties//////////
  private Integer stateId;
  private String state;

  ///////////constructor//////////
  public State() {
    // constructor
  }

  public State(Integer stateId, String state) {
    this.stateId = stateId;
    this.state = state;
  }

  public State(String state) {
    this.state = state;
  }


  /////////////GET-SET///////////
  public Integer getStateId() {
    return stateId;
  }

  public void setStateId(Integer stateId) {
    this.stateId = stateId;
  }

  public String getState() {
    return state;
  }

  public void setState(String state) {
    this.state = state;
  }
}
