import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
} from "typeorm";
import { SocialPostComment } from "./SocialPostComment";
import { SocialGroups } from "./SocialGroups";

@Index("social_posts_pkey", ["id"], { unique: true })
@Entity("social_posts", { schema: "public" })
export class Post {
  @Column("bigint", { primary: true, name: "id" })
  id: string;

  @Column("timestamp without time zone", {
    name: "created_at",
    nullable: true,
    default: () => "now()",
  })
  createdAt: Date | null;

  @Column("timestamp without time zone", {
    name: "updated_at",
    nullable: true,
    default: () => "now()",
  })
  updatedAt: Date | null;

  @Column("boolean", {
    name: "deleted_flg",
    nullable: true,
    default: () => "false",
  })
  deletedFlg: boolean | null;

  @Column("bigint", { name: "user_id" })
  userId: string;
  @Column({ name: 'group_id' })
  groupId: string;
  @Column("text", { name: "content", nullable: true })
  content: string | null;

  @Column("text", { name: "media_uri", nullable: true })
  mediaUri: string | null;

  @Column("point", { name: "location", nullable: true })
  location: string | object | null;

  @Column("integer", { name: "total_like", nullable: true })
  totalLike: number | null;

  @Column("integer", { name: "total_comment", nullable: true })
  totalComment: number | null;

  @OneToMany(
    () => SocialPostComment,
    (socialPostComment) => socialPostComment.post
  )
  socialPostComments: SocialPostComment[];

  @ManyToOne(() => SocialGroups, (socialGroups) => socialGroups.socialPosts)
  @JoinColumn([{ name: "group_id", referencedColumnName: "id" }])
  group: SocialGroups;
}
