package com.pipihao.piyu.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.util.Date;
import java.util.List;

/**
 * @author pipihao
 * @email pphboy@qq.com
 * @date 2021/2/1 14:34
 */
@Data
@ToString
@Accessors(chain = true)
@NoArgsConstructor
public class Comment {
    private Integer id;
    private String content; //内容
    private String piId; //皮物的id
    private Integer cId; //回复该评论的id
    private Integer cTwoId; //次评论的回复的评论
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private Integer userId; // 用户id
    private User user;
    private boolean status; //是否禁止
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")

    private Comment cTwoComment; // 次评论所回复的次评论,需要拿到title
    private List<Comment> comments; // 次评论

    private Date createDate; //创建时间
    private Integer likeNumber; //点赞number
    private Integer rubbishNumber; //踩的number
}
