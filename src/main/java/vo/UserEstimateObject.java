package vo;

public class UserEstimateObject {
   
   private UserEstimate userEstimate;
   private MainObjectCategory object;
   private int objectAmount;
   private int mainObjectNo;
   
   public UserEstimateObject() {}

   public UserEstimate getUserEstimate() {
      return userEstimate;
   }

   public void setUserEstimate(UserEstimate userEstimate) {
      this.userEstimate = userEstimate;
   }

   public MainObjectCategory getObject() {
      return object;
   }

   public void setObject(MainObjectCategory object) {
      this.object = object;
   }

   public int getObjectAmount() {
      return objectAmount;
   }

   public void setObjectAmount(int objectAmount) {
      this.objectAmount = objectAmount;
   }

   public int getMainObjectNo() {
      return mainObjectNo;
   }

   public void setMainObjectNo(int mainObjectNo) {
      this.mainObjectNo = mainObjectNo;
   }

   @Override
   public String toString() {
      return "UserEstimateObject [userEstimate=" + userEstimate + ", object=" + object + ", objectAmount="
            + objectAmount + ", mainObjectNo=" + mainObjectNo + "]";
   }
   
}   