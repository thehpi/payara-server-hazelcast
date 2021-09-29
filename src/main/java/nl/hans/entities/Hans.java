package nl.hans.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;

import javax.xml.bind.annotation.XmlElement;
import java.util.UUID;

@Entity
public class Hans {

  @Id
  private String id;

  @PrePersist
  private void prePersist() {
    if (id != null) {
      return;
    }
    id = UUID.randomUUID().toString();
  }

  private String test1;

  public String getId() {
    return id;
  }

  public String getTest1() {
    return test1;
  }

  public void setTest1(String test1) {
    this.test1 = test1;
  }
}
