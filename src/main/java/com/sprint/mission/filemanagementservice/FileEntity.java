package com.sprint.mission.filemanagementservice;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Entity
@Table(name = "files")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class FileEntity {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  private String fileName;
  private String description;
  private String contentType;
  private String s3Url;
  private String s3Key;
  private Long size;

  public FileEntity(String fileName, String description, String contentType, String s3Url, String s3Key, Long size) {
    this.fileName = fileName;
    this.description = description;
    this.contentType = contentType;
    this.s3Url = s3Url;
    this.s3Key = s3Key;
    this.size = size;
  }
}